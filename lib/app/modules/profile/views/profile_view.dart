import 'package:flutter/material.dart';
import 'package:flutter_tugas_fix/app/data/controller/auth_controller.dart';

import 'package:get/get.dart';
import 'package:flutter_tugas_fix/app/routes/app_pages.dart';
import 'package:flutter_tugas_fix/app/utils/widget/header.dart';
import 'package:flutter_tugas_fix/app/utils/widget/myTask.dart';
import 'package:flutter_tugas_fix/app/utils/widget/profileWidget.dart';
import 'package:flutter_tugas_fix/app/utils/style/AppColors.dart';
import 'package:flutter_tugas_fix/app/utils/widget/SideBar.dart';
import 'package:unicons/unicons.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SizedBox(width: 150, child: SideBar()),
      backgroundColor: AppColors.primaryBg,
      body: SafeArea(
        child: Row(
          children: [
        !context.isPhone 
        ? const Expanded(
            flex: 2,
            child:  SideBar(), 
          )
          : const  SizedBox(),
        Expanded(
          flex: 15,
          child: Column(children: [
            !context.isPhone 
            ? const header()
            : Container(
              // content / isi page / screen
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      _drawerKey.currentState!.openDrawer();
                    }, 
                    icon: const Icon(
                      Icons.menu, 
                      color: AppColors.primaryText ,
            ),
            ),
            const SizedBox(
                width: 15,
              ),
            Column(
           // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Task Management',
                style: TextStyle(
                  fontSize: 20, color: AppColors.primaryText),
                ),
              Text(
                'Manage Task Made Easy with Friends',
                  style: TextStyle(
                    fontSize: 13, color: AppColors.primaryText),
                  ),
            ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Get.defaultDialog(
                  title: 'Sign Out',
                  content: const Text(
                    'Are you sure want to Sign Out?'),
                  cancel: ElevatedButton(
                    onPressed: () => Get.back(),
                    child: const Text(
                      'Cancel'),
                    ), 
                  confirm:  ElevatedButton(
                    onPressed: () => authC.logout(), 
                    child: const Text(
                      'Sign Out'),
                  ),
                );
              },
              child: Row(
                  children: const [
                      Text(
                        'Sign Out', 
                        style: TextStyle(color: AppColors.primaryText, fontSize: 15), 
                      ),
                      SizedBox(
                          width: 5,
              ),
              Icon
              (UniconsLine.align_alt, 
              color: AppColors.primaryText,
              size: 30,
            ),
            ],
            ),
              ), 
            ],
            ),
            ),
            // content / isi page / screen
            Expanded(
              child: Container(
               padding: !context.isPhone? EdgeInsets.all(50): EdgeInsets.all(20),
                margin: !context.isPhone? EdgeInsets.all(10): EdgeInsets.all(0),
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: !context.isPhone? BorderRadius.circular(50): BorderRadius.circular(20)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                  ProfileWidget(),
                    Text(
                              'My Task', 
                              style: TextStyle(
                              color: AppColors.primaryText, 
                              fontSize: 30,
                  ),
                  ),
                    SizedBox(height: 169, child: MyTask()),
                ]),
              ),
            )
          ]),
        )
          ],
        ),
      ),
      );
  }
}
