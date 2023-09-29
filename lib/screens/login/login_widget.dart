import 'package:flutter/material.dart';
import 'package:grocery_app/utils/showUp_animation_util.dart';
import 'package:grocery_app/utils/textfeild_utils.dart';
import '../../utils/text_utils.dart';
class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return  ShowUpAnimation(
      delay: 100,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const   Spacer(),
            Center(
              child: TextUtil(text: "LOGIN",size: 28,color:Theme.of(context).primaryColor,weight: true,),
            ),
          const   Spacer(),
            Field(controller:_emailController , icon: Icons.mail, hinttext: 'Email',),
            const SizedBox(height: 10,),
            Field(controller:_passwordController, icon: Icons.visibility,hinttext: 'Password',),
            const   Spacer(),
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
              alignment: Alignment.centerRight,
                child: TextUtil(text: "Swipe Right to  Register >>",size: 12,color: Colors.grey,)),




          ],
        ),
      ),
    );
  }
}
