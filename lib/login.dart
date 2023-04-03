import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthouse/signin.dart';
import '../color.dart';
class login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  return _loginstate();
  }
}
class _loginstate extends State<login>{
  @override
  Widget build(BuildContext context) {
    var screensize=MediaQuery.of(context).size;
  return Scaffold(
    body: ListView(
      children: [
        Container(
             margin: EdgeInsets.only(top: screensize.height*0.02,
    ),
            child: Image.asset('images/logo.png')),
        SizedBox(
          height: screensize.height*0.02,
        ),
       Center(
         child: Column(
           children: [
             Center(
               child:  Directionality(
                 textDirection: TextDirection.ltr,
                 child: Text('Smart house',
                   style: GoogleFonts.cairo(
                     color:Thintextcolor,
                     fontSize: 24,
                     fontWeight: FontWeight.w700,
                   ),
                 ),
               ),
             ),
             Container(
               margin: EdgeInsets.only(left: 20,right: 20),
               child: Center(
                 child:  Directionality(
                   textDirection: TextDirection.ltr,
                   child: Text('this app required to track you name and your email because we need to keep send you through email our brand new services please allow',
                     style: GoogleFonts.cairo(
                       color:Thintextcolor,
                       fontSize: 18,
                       fontWeight: FontWeight.w400,
                     ),
                   ),
                 ),
               ),
             ),
           ],
         ),
       ),
        SizedBox(
          height: screensize.height*0.0005,
        ),
         Container(
           padding: EdgeInsets.only(left: screensize.width*0.18,
               right: screensize.width*0.22,top: 5,bottom: 5),
            child: Center(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Align(
                  alignment: Alignment.center,
                  child: Text('مرحبا بك ',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cairo(   color:Subthintextcolor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,)
                  ),
                ),
              ),
            ),
          ),


        SizedBox(
          height: screensize.height*0.15,
        ),
        Container(
          width: 300,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25))
          ),
          padding: EdgeInsets.all(3),
          margin: EdgeInsets.only(right: screensize.width*0.25,left:screensize.width*0.25),
          child: ElevatedButton(style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Butn),
            elevation:MaterialStateProperty.all(3),
            shape: MaterialStateProperty.
            all(ContinuousRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(25)) )),
            padding:MaterialStateProperty.all(EdgeInsets.all(5)),
    ), onPressed:(){
            Navigator.push(context,
                MaterialPageRoute(builder:  (context) =>  Signin()));
          }, child: Directionality(
            textDirection: TextDirection.rtl,
            child: Text('التالي',
              style:  GoogleFonts.cairo(
              color:Colors.white,
                fontSize: 24,
              fontWeight: FontWeight.w700,
               )
            ),
          )
          ),
        ),

        SizedBox(
          height: screensize.height*0.039,
        ),
        Container(
          padding: EdgeInsets.only(left: 15,right: 15,top: 0,bottom: 5),
          child: Center(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text('تجاوز',
                style: GoogleFonts.cairo(
                color:Subthintextcolor,
                fontSize: 13,
                fontWeight: FontWeight.w900,
                    )

              ),
            ),
          ),
        ),

      ],
    ),
  );
  }

}