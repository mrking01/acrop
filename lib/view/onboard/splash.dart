import 'dart:async';
import 'package:acrop/helper/sharepref.dart';
import 'package:acrop/view/login/login.dart';
import 'package:flutter/material.dart';
import '../../app.dart';
import '../home/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>  AppSharedPref.getemail()!=null?HomePage(): Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/acro.png',
        width: 250,
        ),
      ),
    );
  }
}