import 'package:flutter/material.dart';
class TextUtil extends StatelessWidget {
  String text;
  Color? color;
  double? size;
  bool? weight;
  TextUtil({super.key,required this.text,this.size,this.color,this.weight});

  @override
  Widget build(BuildContext context) {
    return  Text(text,

      style: TextStyle(color:color?? Colors.black,fontSize:size?? 18,fontFamily: 'RobotoSlab',
          fontWeight:weight==null?FontWeight.normal: FontWeight.w900
      ),);
  }
}