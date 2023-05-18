import 'package:flutter/material.dart';
import 'package:mulit_vendor/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
 String email = '', age = '', password = '', type = '';
  @override
  void initState() {
    super.initState();
    loadData();
  }
 loadData() async {
     SharedPreferences sp =  await SharedPreferences.getInstance();
     email = sp.getString('email') ?? '';
     age = sp.getString('age') ?? '';
    password = sp.getString('password') ?? '';
    type = sp.getString('userType') ?? '';

     setState(() {
       
     });

 }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.yellowAccent[100],
      appBar: AppBar(
        title: const Text('It is a student page.'),
        automaticallyImplyLeading: true,

      ),

       body: Padding(
       padding: const EdgeInsets.all(20),
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
       children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                 const Text('Email'),
                 Text(email.toString()),
          ],
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                 const Text('age'),
                 Text(age.toString()),
          ],
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                 const Text('password'),
                 Text(password.toString()),
          ],
        ),

         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                 const Text('User Type'),
                 Text(type.toString()),
          ],
        ),

        const SizedBox(height: 23,),
        InkWell(
          onTap:() async {
            SharedPreferences sp = await SharedPreferences.getInstance();
            sp.clear();

          Navigator.push(context, MaterialPageRoute(builder: (context) => const LogInScreen(),));


          }, 
          child: Container(
            height: 50,
            width: double.infinity,
            color: Colors.teal,
            child: const Center(
              child: Text('Student'),
            ),
          ),
        )
       ],
       ),
     ),

    );
  }
}
