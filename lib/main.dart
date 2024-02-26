import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gmr_test_app/firebase_options.dart';
import 'package:gmr_test_app/screens/home.dart';
import 'package:gmr_test_app/screens/onboardingscreen.dart';



//import 'package:inst_clone_1/auth/mainPage.dart';
//import 'package:inst_clone_1/firebase_options.dart';

Future<User?> checkAuthenticationStatus() async {
  return FirebaseAuth.instance.authStateChanges().first;
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 /* try {
 

    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCINRuerToLYoumEM7PBN-79oJNQs4twAk",
        appId: "1:586710635386:web:aea467e0fe846eb0453cc3",
        messagingSenderId: "586710635386",
        projectId: "gmrtest-5241f",
      ),
    );
  } on FirebaseException catch (e) {
    if (e.code == 'duplicate-app') {
      await Firebase.initializeApp();
    }
  }*/
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(
     
     MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  @override
  Widget build(BuildContext context) {
  FirebaseAuth auth = FirebaseAuth.instance;

  // Get the current user
  User? user = auth.currentUser;
    return  MaterialApp(
    
      debugShowCheckedModeBanner: false,
      
    home: ScreenUtilInit(designSize: Size(392.727, 781.090), child: (user!= null)?HomeScreen(): onBoardingPage()),
    );
  }
}
