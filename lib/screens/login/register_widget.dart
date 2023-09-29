import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/state_management/loading_provider.dart';
import 'package:grocery_app/utils/toast_utils.dart';
import '../../utils/showUp_animation_util.dart';
import '../../utils/submit_btn_utils.dart';
import '../../utils/text_utils.dart';
import '../../utils/textfeild_utils.dart';
class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final _formKey=GlobalKey<FormState>();

  final TextEditingController _nameController=TextEditingController();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _confirmPasswordController=TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ShowUpAnimation(
        delay: 100,
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: GestureDetector(
            onTap: (){
              debugPrint("Tap");
              FocusManager.instance.primaryFocus?.unfocus();
            },
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
                Field(controller:_passwordController , icon: Icons.key, hinttext: 'Password',isPasswordfeild: true,),
                const SizedBox(height: 10,),
                Field(controller:_confirmPasswordController, icon: Icons.key,hinttext: 'Confirm Password',),
                const  Spacer(),
                Consumer(
                  builder: (_, WidgetRef ref, __) {
                    return SubmitButton(title: 'Submit',onTap: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      debugPrint(_formKey.currentState!.validate().toString());
                      if(_formKey.currentState!.validate()){
                        if(_passwordController.text==_confirmPasswordController.text){
                          debugPrint("Sucess");
                          ref.read(loadingProvider.notifier).update((state) => true);
                          // AuthServices.signupUser(
                          //     _emailController.text, _passwordController.text, _nameController.text, context);
                        }else{
                          debugPrint("fail");
                          ShowToast().showtoast("Confirm Password Should be Same",true);
                        }
                      }else{
                        debugPrint("Error");
                      }

                    },);
                  }
                ),



                const   Spacer(),
                Align(
                    alignment: Alignment.centerLeft,
                    child: TextUtil(text: " << Swipe Left to login",size: 12,color: Colors.grey,)),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
