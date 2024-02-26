// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gmr_test_app/screens/home.dart';
import 'package:gmr_test_app/screens/signup.dart';



class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:((context, snapshot){
          if(snapshot.hasData){
            return const HomeScreen();
          }
          else{
              return const AuthenticationScreen();
          }
        }),)


    )
    ;
  }
}