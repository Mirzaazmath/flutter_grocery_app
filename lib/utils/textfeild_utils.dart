// import 'package:flutter/material.dart';
// class Field extends StatelessWidget {
//   TextEditingController controller;
//   IconData icon;
//    Field({super.key,required this.controller,required this.icon});
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//
//       ),
//
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/state_management/obsure_provider.dart';
import 'package:grocery_app/utils/toast_utils.dart';
class Field extends ConsumerWidget {
  final  TextEditingController controller;
  final String hinttext;
  final bool? isNumberType;
  final IconData icon;
  bool? isPasswordfeild;

  Field({super.key,required this.controller,required this.icon,required this.hinttext,this.isNumberType,this.isPasswordfeild});

  @override
  Widget build(BuildContext context,WidgetRef  ref) {
    final _isObscure =ref.watch(obscureProvider);

    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      margin: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                offset:const  Offset(2,2),
                blurRadius: 2),
            BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(-2,-2),
                blurRadius: 2)]
      ),


      child: TextFormField(
        obscureText: isPasswordfeild==true?_isObscure:false,
        key: ValueKey(hinttext),
        keyboardType: isNumberType==null?TextInputType.emailAddress:TextInputType.number,
        controller: controller,
        maxLines: 1,

        validator: (value) {
          if (value == null || value.isEmpty) {
            ShowToast().showtoast("Please Enter All Values", true);
            return '';
          }
          return null;
        },
        decoration: InputDecoration(
            suffixIcon:isPasswordfeild==true? IconButton(
              icon: Icon( _isObscure ? Icons.visibility_off:Icons.visibility,color: Theme.of(context).primaryColor,),
              onPressed: () {
                ref.read(obscureProvider.notifier).update((state) => !_isObscure);
                // setState(() {
                //   _isObscure = !_isObscure;
                // });
              },
            ):null,
            errorStyle:const  TextStyle(height: 0),
            hintText: hinttext,
            prefixIcon:Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10,),
                height: 30,
                width: 30,
                decoration:  BoxDecoration(
                    border: Border(right: BorderSide(color: Colors.grey.shade300,width: 2))
                ),
                child: Icon(icon,color: Theme.of(context).primaryColor,),
              ),
            ),




            border: InputBorder.none
        ),
      ),
    );
  }
}
