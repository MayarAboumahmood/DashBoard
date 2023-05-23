import 'package:flutter/material.dart';
import '../../widget/slide_drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:Row(
        children:[
          SlideDrawer(),
          Center
          (child:Text('what teh fuck')),
        ]
      )
    );
  }
}