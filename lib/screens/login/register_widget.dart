import 'package:flutter/material.dart';

import '../../utils/showUp_animation_util.dart';
import '../../utils/text_utils.dart';
import '../../utils/textfeild_utils.dart';
class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {

  TextEditingController _nameController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  TextEditingController _confimPasswordController=TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confimPasswordController.dispose();
    _nameController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      delay: 100,
      child: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const  Spacer(),
            Center(
              child: TextUtil(text: "Create Account",size: 22,color:Theme.of(context).primaryColor,weight: true,),
            ),
            const  Spacer(),

            Field(controller:_nameController , icon: Icons.person, hinttext: 'Name',),
            const SizedBox(height: 10,),
            Field(controller:_emailController , icon: Icons.mail, hinttext: 'Email',),
            const SizedBox(height: 10,),
            Field(controller:_passwordController , icon: Icons.key, hinttext: 'Password',),
            const SizedBox(height: 10,),
            Field(controller:_confimPasswordController, icon: Icons.key,hinttext: 'Password',),
            const  Spacer(),
            GestureDetector(
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow:[
                      BoxShadow(
                          color:Colors.grey.shade400,
                          offset:const  Offset(4,4),
                          blurRadius: 10
                      ),
                      BoxShadow(
                          color:Colors.grey.shade300,
                          offset:const  Offset(-3,-3),
                          blurRadius: 10
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor
                ),
                alignment: Alignment.center,
                child: TextUtil(text: "Submit",color: Colors.white,size: 22,),
              ),
            ),

            const   Spacer(),
            Align(
                alignment: Alignment.centerLeft,
                child: TextUtil(text: " << Swipe Left to login",size: 12,color: Colors.grey,)),



          ],
        ),
      ),
    );
  }
}
