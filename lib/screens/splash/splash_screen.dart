import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/showUp_animation_util.dart';
import '../../utils/text_utils.dart';
import '../landing/landing_screen.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /// USING TIMER TO AUTO NAVIGATE TO LOGIN SCREEN AFTER 3 SECONDS
    Timer( const Duration(seconds: 3),(){
      /// USING PUSHREPLACEMENT  TO CUT OUT THE SPLASH SCREEN FROM NAVIGATION STACK
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          const SizedBox(height: 100,),
          Center(
            /// USING LOTTIE ANIMATION FILE
            child: Lottie.asset('assets/splash.json'),),

          /// Custom Animation for Show Up Widget
          ShowUpAnimation(
            delay: 200,
              /// TextUtil class handel all Text
              child: TextUtil(text: "Fresh Mart",size: 42,color: Theme.of(context).primaryColor,)),
          /// Custom Animation for Show Up Widget
          ShowUpAnimation(
            delay: 300,
              /// TextUtil class handel all Text
              child: TextUtil(text: "One App For All Needs"))

        ],
      ),

    );
  }
}
