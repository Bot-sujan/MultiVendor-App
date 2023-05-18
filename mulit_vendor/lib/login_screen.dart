import 'package:flutter/material.dart';
import 'package:mulit_vendor/admin_screen.dart';
import 'package:mulit_vendor/student_screen.dart';
import 'package:mulit_vendor/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';




class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
    final ageController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
         title: const Text('SignUp'),
         automaticallyImplyLeading: false,
         
      ),
     body: Padding(
       padding: const EdgeInsets.all(20),
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
       children: [
        TextFormField(
          controller: emailController,
           decoration:  const InputDecoration(
            hintText: 'Email',
           ),
        ),
     
        const  SizedBox(height: 20,),
        
        TextFormField(
          controller: passwordController,
           decoration:  const InputDecoration(
            hintText: 'Password',
           ),
        ),

        const  SizedBox(height: 20,),


         TextFormField(
          keyboardType: TextInputType.number,
          controller: ageController,
           decoration:  const InputDecoration(
            hintText: 'Age',
           ),
        ),

       const SizedBox(height: 20,),

        InkWell(
          onTap:() async {
           SharedPreferences sp = await SharedPreferences.getInstance();
           sp.setString('email', emailController.text.toString());
           sp.setString('password', passwordController.text.toString());
           sp.setString('age', ageController.text.toString());

           //admin, student, teacher

           sp.setString('userType', 'admin');


            sp.setBool('isLogIn', true);

            if(sp.getString('userType') == 'student') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => StudentScreen(),));

            } else if(sp.getString('userType') == 'teacher') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const TeacherScreen(),));
          }  else {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminScreen(),));

          }



          }, 
          child: Container(
            height: 50,
            width: double.infinity,
            color: Colors.teal,
            child: const Center(
              child: Text('SignUp'),
            ),
          ),
        )
       ],
       ),
     ),

    );
  }
}