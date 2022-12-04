import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_tugas_fix/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  UserCredential? _userCredential;
  Future signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  print(googleUser!.email);
  // Once signed in, return the UserCredential
  await FirebaseAuth.instance.signInWithCredential(credential).
  then((value) => _userCredential = value);

  // firebase 
  CollectionReferene users = firestore.collection('users');

 final cekUsers = await users.doc(googleUser.email).get();
 if (!cekUsers.exists) {
  users.doc(googleUser.email).set({
    'uid':_userCredential.user!.uid,
    'name': googleUser.displayName,
    'email':googleUser.email,
    'photo':googleUser.email,
    'LastLoginAt':_userCredential!.user.metadata.lastSignInTime,
  });
 }else{

 }
}
Future logout() async {
  await FirebaseAuth.instance.signOut();
  await GoogleSignIn().signOut();
  Get.offAllNamed(Routes.LOGIN);
 }
}