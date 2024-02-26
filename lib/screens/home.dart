// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gmr_test_app/functions/authFunction.dart';
import 'package:gmr_test_app/properties/appcolors.dart';
import 'package:gmr_test_app/screens/detailedPage.dart';
//import 'package:gmr_test_app/screens/logoutPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gmr_test_app/screens/detailedwebPage.dart';
import 'package:gmr_test_app/screens/signup.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
 


 

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      appBar: AppBar(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(50.r),
          child: Image.asset('assets/images/logo.png',height: 5.h,)),
        backgroundColor:const Color.fromARGB(255, 1, 52, 134),
        title: const Text("Mind Peace",style: TextStyle(color: Color.fromARGB(255, 231, 231, 231)),),
       actions: [
       Builder(
              builder: (context) => IconButton(
                    icon: Icon(Icons.menu,color: Colors.white,),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                    tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                  ),
            ),
       ],
      ),
      
      endDrawer:  Drawer(
             
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                   DrawerHeader(
                    decoration: BoxDecoration(
            color: AppColor().backgroundTheme,
            
                    ),
                    child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: AppColor().backgroundTheme,
                    ),
                      accountName: Text("",
                      style: TextStyle(fontSize: 18),), 
                      accountEmail: Text("Mind Peace",
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      currentAccountPictureSize: Size.square(60),
                      currentAccountPicture: CircleAvatar(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: Image.asset('assets/images/logo.png')),
                      ),
                      ),
                  ),
                  ListTile(
                    title:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [ 
                SizedBox(
                  width: 10.w,
                ),
                Icon(Icons.logout,size: 30.w,color: AppColor().backgroundTheme,),
                SizedBox(
                  width: 10.w,
                ),
                Text("Logout",style: TextStyle(fontSize: 20,color: AppColor().backgroundTheme),),
              ],
            ) ,
                    onTap: () {
            signOut();
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=>AuthenticationScreen()));
                    },
                  ),
                  
                ],
              ),
            ),
      body:


         Container(
           child: StreamBuilder
           (stream: FirebaseFirestore.instance.collection('diseases').snapshots(),
            builder: (context,mindSnapshot){
              if(mindSnapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }
              else{
                final minddoc=mindSnapshot.data!.docs;
                return GridView.builder(
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2,
                   //crossAxisSpacing: 2.0, // Adjust as needed
                   //mainAxisSpacing: 2.0,   // Adjust as needed
                 ),
                 itemCount: minddoc.length,
                 itemBuilder: (context, index) {
                   return GestureDetector(
            onTap: () {
               Navigator.push(
             context,
             MaterialPageRoute(builder: (context) =>
         ( kIsWeb)?
            DetailedwebPage(minddoc[index]['title'], minddoc[index]['imgurl'], minddoc[index]['content'], minddoc[index]['yturl'],index):

          
              DetailedPage(minddoc[index]['title'], minddoc[index]['imgurl'], minddoc[index]['content'], minddoc[index]['yturl'],index),
            
             
             
),
           );
             
              print("click");
            },
            child: Container(
              padding: EdgeInsets.all(20.w),
              margin: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                    color: Color.fromARGB(255, 114, 126, 215), // Set your desired border color
                    width: 2.0, // Set the border width
                  ), 
              ),
              child: Column(
                children: [ 
                   Image.asset(
              minddoc[index]['imgurl'],
             // width: 50, // Adjust the width as needed
              height: 90.h, // Adjust the height as needed
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10.h,),
                  Text(minddoc[index]['title'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.r),),
                ],
              ),
            ),
                   )
                   ;
                 },
               );
              }
            })
           
         ),
       

    );
  }
}