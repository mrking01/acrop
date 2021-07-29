import 'package:acrop/helper/sharepref.dart';
import 'package:acrop/view/onboard/splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'view/login/login.dart';
import 'view/login/signup.dart';

void main()async{ 
    WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPref.init();
  runApp( MyApp());}
SharedPreferences? preferences;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) =>  SignupPage(),
                '/home': (BuildContext context) =>  HomePage(),
                 '/login': (BuildContext context) =>  Login()
      },
      home:SplashScreen(),
    );
  }
}
