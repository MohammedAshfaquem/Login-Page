import 'package:flutter/material.dart';
import 'package:loginpage/pages/loginpage.dart';
import 'package:loginpage/pages/registerpage.dart';

// ignore: camel_case_types
class authpage extends StatefulWidget {
  const authpage({super.key});

  @override
  State<authpage> createState() => _authpageState();
}

// ignore: camel_case_types
class _authpageState extends State<authpage> {
  bool isloginpage = true;

  void togglescreen() {
    setState(() {
      isloginpage = !isloginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isloginpage) {
      return loginpage(
        register: togglescreen,
      );
    } else {
      return Registerpage(
        loginnow: togglescreen,
      );
    }
  }
}
