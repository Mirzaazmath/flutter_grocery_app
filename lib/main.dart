import 'package:flutter/material.dart';
import 'package:grocery_app/screens/splash/splash_screen.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primaryColor:const  Color(0xffff5050)
      ),
      debugShowCheckedModeBanner: false,
      home:const  SplashScreen(),
    );
  }
}
