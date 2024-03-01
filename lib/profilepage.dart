import 'package:flutter/material.dart';

class Profilepage extends StatelessWidget{
  Profilepage({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> natgatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(children: [
            SizedBox(
              height: 74,
            )
          ],),
        ),
      )
    );
  }
}