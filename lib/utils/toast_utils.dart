import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_app/utils/color_utils.dart';
class ShowToast{
  final color=AppColors();
  void showtoast(String msg, bool isError){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: isError? color.primaryColor:color.lightGreen,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }



}
