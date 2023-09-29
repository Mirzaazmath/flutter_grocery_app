import 'package:flutter/material.dart';
class AutoScrollListComponent extends StatelessWidget {
  final ScrollController controller;
  final List<String> itemList;
  const AutoScrollListComponent({super.key,required this.controller,required this.itemList});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(top: 14),
      child: SizedBox(
        height: 100,

        child: ListView.builder(
            shrinkWrap: true,
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: itemList.length,
            itemBuilder: (context,index){
              return Container(
                height: 120,
                width: 120,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color:Colors.cyan.shade100,
                    borderRadius: BorderRadius.circular(10),
                    // image: DecorationImage(
                    //   image: AssetImage(itemList[index]),fit: BoxFit.cover,
                    // )
                ),
                child: Image.asset(itemList[index]),
              );
            }),
      ),
    );
  }
}