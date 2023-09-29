import 'package:flutter/material.dart';
import 'package:grocery_app/screens/login/login_widget.dart';
import 'package:grocery_app/screens/login/register_widget.dart';

import '../../utils/color_utils.dart';
import '../../utils/showUp_animation_util.dart';
import '../../utils/text_utils.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   PageController pageController=PageController();
  double _progress=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
      _progress=pageController.page??0;
      debugPrint(_progress.toString());

    });});
  }
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(

        child: Column(
          children: [

           SizedBox(
             height: height*0.4-_progress*140,

             child:  Center(
               child: ShowUpAnimation(
                   delay: 200,

                   child: TextUtil(text: "Fresh Mart",size: 45,color: Colors.white,)),
             ),
           ),
          
            Container(
              height: height*0.6+_progress*140,
              decoration:  BoxDecoration(
                color: AppColors().white,
                borderRadius:const  BorderRadius.vertical(top: Radius.circular(30))
              ),
              child: PageView(
                controller: pageController,
                children: [
                  LoginWidget(),
                  RegisterWidget()

                ],
              ),
            )



          ],
        ),
      ),
    );
  }
}
