import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Container(margin: EdgeInsets.all(Get.height * 0.1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      child: Row(children: [
        Expanded(child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), bottomLeft: Radius.circular(50),
      ), 
      color: Colors.blue,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Welcome', style: TextStyle(color: Colors.white, fontSize: 70,
          ),),
          Text('Please Sign In', style: TextStyle(color: Colors.white, fontSize: 30,
          ),
          ),
          ),
      ),
        Text('Start Journey With Us', style: TextStyle(
          color: Colors.white, 
        fontSize: 20,
        ), 
        ), 
      ]),
      ),
        Expanded(
        child: Container(
          decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
              topRight: Radius.circular(50), 
              bottomRight: Radius.circular(50),
              ), 
          ),
          child: Column(children: [
            Image.asset('assets/images/login.png'),
          FloatingActionButton.extended(
            onPressed: (){}, label: text('Sign In With Google'), Icon(icon), )
          ]),
      ),
      ),
      ]),
  }
}
