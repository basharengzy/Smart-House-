import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../color.dart';
class contactus extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _contactusstate();
  }
}
class _contactusstate extends State<contactus>{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(height: 90,),
          Center(
            child: Directionality(
              textDirection: TextDirection.rtl,
              //${datalst[index]['des']}
              child: Text('تواصل معنا',
                style:GoogleFonts.cairo(
                  color:Thintextcolor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                )
                ,
              ),
            ),
          ),
          SizedBox(height: 30,),
           InkWell(
             onTap: _callNumber,
             child: Container(
               height: 100,
               margin: EdgeInsets.only(right: 10,left: 10),
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.all(Radius.circular(25)),
                   color:Butn
               ),
               child: Row(
                 children: [
                   Container(
                     margin: EdgeInsets.only(left: 15),
                     child: Directionality(
                       textDirection: TextDirection.ltr,
                       //${datalst[index]['des']}
                       child: Text('+962796334142',
                         style:GoogleFonts.cairo(
                           color:Thintextcolor,
                           fontSize: 18,
                           fontWeight: FontWeight.w700,
                         )
                         ,
                       ),
                     ),
                   ),
                SizedBox(width: 60,),
                   Container(
                     margin: EdgeInsets.only(right: 10),
                     child: Directionality(
                       textDirection: TextDirection.rtl,
                       //${datalst[index]['des']}
                       child: Text('اتصل بنا على الرقم',
                         style:GoogleFonts.cairo(
                           color:Thintextcolor,
                           fontSize: 14,
                           fontWeight: FontWeight.w700,
                         )
                         ,
                       ),
                     ),
                   ),
                   Align(
                     alignment: AlignmentDirectional.center,
                     child: Container(
                       margin: EdgeInsets.only(right: 5),
                       child: Icon(FontAwesomeIcons.phone),
                     ),
                   ),
                 ],
               ),
             ),
           ),

          ///second
          SizedBox(height: 25,),
          InkWell(
            onTap: _callNumber2,
            child: Container(
              height: 100,
              margin: EdgeInsets.only(right: 10,left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color:Butn
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text('+962796506059',
                        style:GoogleFonts.cairo(
                          color:Thintextcolor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )
                        ,
                      ),
                    ),
                  ),
                  SizedBox(width: 60,),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text('اتصل بنا على الرقم',
                        style:GoogleFonts.cairo(
                          color:Thintextcolor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        )
                        ,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Container(
                      margin: EdgeInsets.only(right: 5),
                      child: Icon(FontAwesomeIcons.phone),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ///third
          SizedBox(height: 25,),
          InkWell(
            onTap: _sendemail,
            child: Container(
              height: 100,
              margin: EdgeInsets.only(right: 5,left: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color:Butn
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      //${datalst[index]['des']}
                      child: Text('Alhtaac@gmail.com',
                        style:GoogleFonts.cairo(
                          color:Thintextcolor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )
                        ,
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      //${datalst[index]['des']}
                      child: Text('ارسل رسالة علي الايميل',
                        style:GoogleFonts.cairo(
                          color:Thintextcolor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        )
                        ,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Container(
                      margin: EdgeInsets.only(right: 5),
                      child: Icon(FontAwesomeIcons.envelope),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ///third
        ],
      ),
    );
  }
  _callNumber() async{
    const number = '+962796334142'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
  _callNumber2() async{
    const number = '+962796506059'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
  _sendemail() async{
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'Alhtaac@gmail.com',

    );
    launchUrl(emailLaunchUri);
  }
}