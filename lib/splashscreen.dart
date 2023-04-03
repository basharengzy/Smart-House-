import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'color.dart';
import 'login.dart';
class splashscreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _splashstate();
  }
}
class _splashstate extends State<splashscreen>{
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5), ()=>gohomescreen());
  }
  void gohomescreen(){
    Navigator.push(context,
        MaterialPageRoute(builder:  (context) =>  login()));
  }
  final spinkiticon=SpinKitFoldingCube(
    itemBuilder: (BuildContext context,index){
      return DecoratedBox(decoration: BoxDecoration(
          color: index.isEven? Butn:Color(0xFF455048)
      ));
    },
  );
  @override
  Widget build(BuildContext context) {
    var woosize=MediaQuery.of(context).size;
    var woowidth=woosize.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: new BoxDecoration(
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: woowidth/1.2,
              child: Image.asset('images/logo.png'),
            ),
            SizedBox(height: 30,),
            spinkiticon
          ],
        ),
      ),

    );
  }
}