
import 'package:flutter/material.dart';
import 'package:grocery_app/screens/landing/landing_componets/landing_screen_data.dart';

import 'landing_componets/landing_autosroll_compnent.dart';
class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  ScrollController scrollController1=ScrollController();
  ScrollController scrollController2=ScrollController();
  ScrollController scrollController3=ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double minScrollExtend1=scrollController1.position.minScrollExtent;
      double maxScrollExtend1=scrollController1.position.maxScrollExtent;
      double minScrollExtend2=scrollController2.position.minScrollExtent;
      double maxScrollExtend2=scrollController2.position.maxScrollExtent;
      double minScrollExtend3=scrollController3.position.minScrollExtent;
      double maxScrollExtend3=scrollController3.position.maxScrollExtent;
      animateToMaxMin(maxScrollExtend1,minScrollExtend1,minScrollExtend1,5,scrollController1);
      animateToMaxMin(maxScrollExtend2,minScrollExtend2,minScrollExtend2,10,scrollController2);
      animateToMaxMin(maxScrollExtend3,minScrollExtend3,minScrollExtend3,7,scrollController3);
    });

  }
  animateToMaxMin(double max, double min,double direction,int second,ScrollController controller){
    controller.animateTo(direction, duration: Duration(seconds:second ), curve: Curves.linear).then((value) {
      direction=direction==max?min:max;
      animateToMaxMin(max,min,direction,second,controller);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.62,

              child: Stack(
                children: [

                  Column(
                    children: [
                      Transform.rotate(
                        angle: 6,
                          child: AutoScrollListComponent(controller: scrollController1, itemList: itemList1,)),
                     const SizedBox(height: 10,),
                      Transform.rotate(
                          angle: 6,
                        child : AutoScrollListComponent(controller: scrollController2, itemList: itemList2,)),
                      const SizedBox(height: 10,),
                      Transform.rotate(
                          angle: 6,
                          child: AutoScrollListComponent(controller: scrollController3, itemList: itemList3,)),

                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.white,
                          Colors.white,
                          Colors.white.withOpacity(0.7),

                        ]
                      )
                        )
                      ),
                    ),

                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}