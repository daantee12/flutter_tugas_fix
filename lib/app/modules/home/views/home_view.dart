
import 'package:flutter/material.dart';
import 'package:flutter_tugas_fix/app/utils/widget/myTask.dart';
import 'package:flutter_tugas_fix/app/utils/widget/myfriends.dart';

import 'package:get/get.dart';
import 'package:flutter_tugas_fix/app/utils/widget/header.dart';
import 'package:flutter_tugas_fix/app/routes/app_pages.dart';
import 'package:flutter_tugas_fix/app/utils/style/AppColors.dart';
import 'package:flutter_tugas_fix/app/utils/widget/SideBar.dart';
import 'package:flutter_tugas_fix/app/utils/widget/upcomingTask.dart';


import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
   final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SizedBox(width: 150, child: SideBar()),
      backgroundColor: AppColors.primaryBg,
     
      body: SafeArea(
        child: Row(
          children: [
         !context.isPhone?  Expanded(
            flex: 2,
            child:   const SideBar(),
          ): const SizedBox(),
          Expanded(
            flex: 15,
            child: Column(
              children: [
                !context.isPhone? const header(): 
                Container(
                  //content /isipage /screen
                  padding: EdgeInsets.all(20),
                child: Row(children: [IconButton(onPressed: (){
                  _drawerKey.currentState!.openDrawer();
                }, icon: Icon(Icons.menu, color: AppColors.primaryText,
                ),
  
                   ),
                   Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Task Management',style:TextStyle(fontSize: 20, color: AppColors.primaryText),
          ),
          Text('Manage task made easy',style: TextStyle(fontSize: 14, color: AppColors.primaryText),
          ),
          ],
          ),
          Spacer(),
         const Icon(Icons.notifications,color: Colors.grey,size: 30,
         ),
         const SizedBox(width: 15,
         ),
          ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: const CircleAvatar(
                              backgroundColor: Colors.amber, 
                              radius: 25, 
                              foregroundImage: NetworkImage(
                                    'https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/09/27/08/jennifer-lawrence.jpg?quality=75&width=982&height=726&auto=webp%27',
         ),
         ),
         ),
                ],
                ),
                ),
            Expanded(child: Container(
              padding: !context.isPhone? EdgeInsets.all(50): EdgeInsets.all(20),
              margin: !context.isPhone? EdgeInsets.all(10): EdgeInsets.all(0),
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: !context.isPhone? BorderRadius.circular(50): BorderRadius.circular(30)
              ),
              child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(
                       height: Get.height * 0.3,
                       child: 
                      
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                          Text(
                            'My Task', 
                            style: TextStyle(
                              color: AppColors.primaryText, 
                              fontSize: 30,
                                     ),
                                     ),
                                          SizedBox(
                                            height: 20,
                                            
                                          ),
              //mystask
              MyTask(),
            
                         ],
                       ),
                     ),
          !context.isPhone? Expanded(
               child: Row(
                 
                 children: [
                   UpcomingTask(),
                   MyFriends(),
                   
                     
                 ],    
                ),
             ): UpcomingTask(),
              ]),
            ),
            ),
            
            ]),
          ),
        ],
        ),
      ),
    );
  }
}