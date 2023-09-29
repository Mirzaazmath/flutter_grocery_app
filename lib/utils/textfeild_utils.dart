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
class Field extends StatelessWidget {
  final  TextEditingController controller;
  final String hinttext;
  final bool? isNumberType;
  final IconData icon;

  const Field({super.key,required this.controller,required this.icon,required this.hinttext,this.isNumberType});

  @override
  Widget build(BuildContext context) {
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
        keyboardType: isNumberType==null?TextInputType.emailAddress:TextInputType.number,
        controller: controller,
        maxLines: 1,
        decoration: InputDecoration(
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
