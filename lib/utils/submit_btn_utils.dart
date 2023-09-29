import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/state_management/loading_provider.dart';
import 'package:grocery_app/utils/color_utils.dart';
import 'package:grocery_app/utils/text_utils.dart';
class SubmitButton extends ConsumerWidget {
  final String title;
  final  VoidCallback onTap;
  const SubmitButton({super.key,required this.title,required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(loadingProvider);
    return  GestureDetector(
      onTap: onTap,
      child: Center(
        child: AnimatedContainer(
          height: 50,
          width:loading?50: MediaQuery.of(context).size.width,
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
              borderRadius: BorderRadius.circular( loading?50:10),
              color: Theme.of(context).primaryColor
          ),
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 400),
          child:loading? CircularProgressIndicator(color: AppColors().white,): TextUtil(text: title,color: Colors.white,size: 22,),
        ),
      ),
    );
  }
}
