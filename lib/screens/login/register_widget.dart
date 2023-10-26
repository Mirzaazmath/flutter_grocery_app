import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/state_management/loading_provider.dart';
import 'package:grocery_app/utils/toast_utils.dart';
import '../../services/auth_services.dart';
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
  // Form Key
  final _formKey=GlobalKey<FormState>();
  // For Name
  final TextEditingController _nameController=TextEditingController();
  // For Email
  final TextEditingController _emailController=TextEditingController();
  // For Password
  final TextEditingController _passwordController=TextEditingController();
  // For ConfirmPassword
  final TextEditingController _confirmPasswordController=TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    // Dispose
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
      // Animation
      child: ShowUpAnimation(
        delay: 100,
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: GestureDetector(
            onTap: (){
              debugPrint("Tap");
              // To Unfocus KeyBoard
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const  Spacer(),
                // Title
                Center(
                  child: TextUtil(text: "Create Account",size: 22,color:Theme.of(context).primaryColor,weight: true,),
                ),
                const  Spacer(),
                 // For Name
                Field(controller:_nameController , icon: Icons.person, hinttext: 'Name',),
                const SizedBox(height: 10,),
                // For Email
                Field(controller:_emailController , icon: Icons.mail, hinttext: 'Email',),
                const SizedBox(height: 10,),
                // For Password
                Field(controller:_passwordController , icon: Icons.key, hinttext: 'Password',isPasswordfeild: true,),
                const SizedBox(height: 10,),
                // For ConfirmPassword
                Field(controller:_confirmPasswordController, icon: Icons.key,hinttext: 'Confirm Password',),
                const  Spacer(),
                // Submit Button
                Consumer(
                  builder: (_, WidgetRef ref, __) {
                    return SubmitButton(title: 'Submit',onTap: () async {
                      // Unfocusing  the Keyboard
                      FocusManager.instance.primaryFocus?.unfocus();
                      // print
                      debugPrint(_formKey.currentState!.validate().toString());
                      // Validating
                      if(_formKey.currentState!.validate()){
                        // checking both password and confirm password are same or not
                        if(_passwordController.text==_confirmPasswordController.text){

                          debugPrint("Sucess");
                          // here we are change the loading state
                          ref.read(loadingProvider.notifier).update((state) => LoadingState.loading);
                          // this section help us to create a user in database and we are  passing email, and password and name and ref to handle state while Sign Up
                          AuthServices.signupUser(
                              _emailController.text, _passwordController.text, _nameController.text, context,ref);
                          // for clearing the fields
                          if(LoadingState.success== ref.watch(loadingProvider.notifier).state){
                            _nameController.text="";
                            _emailController.text="";
                            _passwordController.text="";
                            _confirmPasswordController.text="";

                          }

                        }else{
                          // same password error

                          debugPrint("fail");
                          ShowToast().showtoast("Confirm Password Should be Same",true);
                        }
                      }else{
                        // validation error
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
