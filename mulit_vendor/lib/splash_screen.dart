import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mulit_vendor/admin_screen.dart';
import 'package:mulit_vendor/login_screen.dart';
import 'package:mulit_vendor/student_screen.dart';
import 'package:mulit_vendor/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {

    super.initState();

   isLogIn();
  }


void isLogIn() async {
   SharedPreferences sp = await SharedPreferences.getInstance();
   bool isLogIn = sp.getBool('isLogIn') ?? false;
   String userType = sp.getString('userType') ?? '';

   if (isLogIn) {

    if (userType == 'student') {
Timer(const Duration(seconds: 4), () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentScreen()));
    });
    } else if(userType == 'teacher') {
      Timer(const Duration(seconds: 4), () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => const TeacherScreen()));
    });
    } else {
       Timer(const Duration(seconds: 4), () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminScreen()));
    });
    }       
   } else {
     Timer(const Duration(seconds: 4), () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => const LogInScreen()));
    });
   }
}
@override
  Widget build(BuildContext context) {
    return const Scaffold(
       body: Image(
        height: double.infinity,
        fit: BoxFit.fitHeight,
        image: NetworkImage('https://images.pexels.com/photos/16838330/pexels-photo-16838330.jpeg?auto=compress&cs=tinysrgb&w=1200&lazy=load')),
    );
  }
}