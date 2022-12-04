import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tugas_fix/app/routes/app_pages.dart';
import 'package:flutter_tugas_fix/app/utils/style/AppColors.dart';
import 'package:unicons/unicons.dart';

class MyFriends extends StatelessWidget {
  const MyFriends({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:SingleChildScrollView(
            child: Column (
              children: [
                Row(
                  children: [
                      Text('My Friends', style: TextStyle(color: AppColors.primaryText, fontSize: 30,
                      ),
                      ),
                      Spacer(),
                       GestureDetector(
                         onTap: ()=> Get.toNamed(Routes.FRIENDS),
                         child: Text('more', style: TextStyle(color: AppColors.primaryText, fontSize: 25,
                                           ),
                                           ),
                       ),
                      Icon(UniconsLine.arrow_right, color: AppColors.primaryText,)
                  ],
                      ),
                       SizedBox(height: 20,
                        ),
                        SizedBox(height: 400,child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: 9,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:context.isPhone? 2 : 3, crossAxisSpacing: 20, mainAxisSpacing: 20), itemBuilder: (context,index){
                           return Column(children: [
                              ClipRRect(borderRadius: BorderRadius.circular(100),
                   child: Image(
                    image : 
                    NetworkImage('https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/09/27/08/jennifer-lawrence.jpg?quality=75&width=982&height=726&auto=webp%27',
                   ),
                   ),
                   ),
                   Text('Alicia Jasmine', style: TextStyle(color: AppColors.primaryText),)
                
                           ],);
                        }),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
