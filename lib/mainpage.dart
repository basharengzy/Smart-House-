import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kdgaugeview/kdgaugeview.dart';
import 'package:smarthouse/splashscreen.dart';
import 'color.dart';
class mainpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      return _mainpagestate();
  }
}

class _mainpagestate extends State<mainpage>{
  var t1val;
  var t2val='';
  var t3val='';
  var t4val='';
  var t5val='';
  var database = FirebaseDatabase.instance.reference();
  lisnartoval(){
    database.child('data/t1').onValue.listen((event) {
      var  t1=event.snapshot.value;
      setState(() {
        t1val=t1;
      });
    });
    database.child('data/t2').onValue.listen((event) {
      var  t2=event.snapshot.value;
      setState(() {
        t2val='$t2';
      });
    });
    database.child('data/t3').onValue.listen((event) {
      var  t3=event.snapshot.value;
      setState(() {
        t3val='$t3';
      });
    });
    database.child('data/t4').onValue.listen((event) {
      var  t4=event.snapshot.value;
      setState(() {
        t4val='$t4';
      });
    });
    database.child('data/pumb').onValue.listen((event) {
      var  t5=event.snapshot.value;
      setState(() {
        t5val='$t5';
      });
    });
  }
   @override
  void initState() {
   lisnartoval();
   print('===========================================================');
   print('===========================================================');
   print('==========================${t1val}===========================');
   print('==========================${t2val}===========================');
   print('==========================${t3val}===========================');
   print('==========================${t4val}===========================');
   print('==========================${t5val}===========================');
   print('===========================================================');
   print('===========================================================');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    var screensize=MediaQuery.of(context).size;
      return Scaffold(
        body: ListView(
          children: [
            SizedBox(height:22),
            Container(
              margin: EdgeInsets.only(top: 10,bottom: 10),
              padding:EdgeInsets.all(10),
              width:screensize.width,
              child: Row(
                children: [
                  Column(
                    children: [
                      InkWell(
                          onTap: ()async{
                            await _signOut().then((value) {
                              Navigator.push(context, MaterialPageRoute(builder:
                                  (context) => splashscreen(),));
                            });
                          },
                          child: Image.asset('images/logout.jpeg',
                            height: 30,
                            width: 30,
                          )),
                      SizedBox(height: 15,),
                      InkWell(
                        onTap: ()async{
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.info,
                            borderSide: const BorderSide(
                              color: Colors.green,
                              width: 2,
                            ),
                            width: 280,
                            buttonsBorderRadius: const BorderRadius.all(
                              Radius.circular(2),
                            ),
                            dismissOnTouchOutside: true,
                            dismissOnBackKeyPress: false,
                            headerAnimationLoop: false,
                            animType: AnimType.bottomSlide,
                            title: 'تحذير(attention)',
                            desc: ' This operation is sensitive and requires recent authentication.'
                                'Logout first then Login again before delete your account.'
                                '  هذا الخيار يؤدي الى حذف حسابك',
                            showCloseIcon: true,
                            btnCancelOnPress: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => mainpage(),));
                            },
                            btnOkOnPress: () async{
                              User? user = FirebaseAuth.instance.currentUser;
                              await user!.delete().whenComplete(() {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  borderSide: const BorderSide(
                                    color: Colors.green,
                                    width: 2,
                                  ),
                                  width: 280,
                                  buttonsBorderRadius: const BorderRadius.all(
                                    Radius.circular(2),
                                  ),
                                  dismissOnTouchOutside: true,
                                  dismissOnBackKeyPress: false,
                                  headerAnimationLoop: false,
                                  animType: AnimType.bottomSlide,
                                  title: 'تم حذف حسابك ',
                                  desc: 'your account was deleted'
                                      'you will back to welcome screen.',
                                  showCloseIcon: true,
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {},
                                ).show().then((value){
                                  Navigator.push(context, MaterialPageRoute(builder:
                                      (context) => splashscreen(),));
                                });

                              });
                            },
                          ).show().then((value) async{
                            print('done');
                          }
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: screensize.width*0.01,
                          ),
                          child: Text('account deletion',
                            style:GoogleFonts.cairo(
                              color: Thintextcolor,
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: screensize.width*0.01,
                          right:screensize.width*0.05,left:
                          screensize.width*0.10),
                      child: Image.asset('images/logo.png',
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 25,),
            ///to here stop
            Container(
              width: screensize.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 170,
                    height: 200,
                    margin: EdgeInsets.only(left: 5,right: 5),
                    child: KdGaugeView(
                      minSpeed: 0,
                      maxSpeed: 100,
                      minMaxTextStyle:GoogleFonts.cairo(
                        fontSize: 11,
                      ),
                      speedTextStyle: GoogleFonts.cairo(
                        fontSize: 36,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        height: 3,

                      ),
                      unitOfMeasurementTextStyle:GoogleFonts.cairo(
                        fontSize: 0,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        height: 0,

                      ),
                      gaugeWidth: 6.0,
                      speed:double.parse('$t1val'),
                      animate: true,
                      duration: Duration(seconds: 1),
                    ),
                  ),
                  Container(
                    width: 170,
                    height: 200,
                    margin: EdgeInsets.only(left: 5,right: 5),
                    child: KdGaugeView(
                      minSpeed: 0,
                      maxSpeed: 100,
                      minMaxTextStyle:GoogleFonts.cairo(
                       fontSize: 11,
                      ),
                      speedTextStyle: GoogleFonts.cairo(
                        fontSize: 36,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        height: 3,

                      ),
                      unitOfMeasurementTextStyle:GoogleFonts.cairo(
                        fontSize: 0,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        height: 0,

                      ),
                      gaugeWidth: 6.0,
                      speed: double.parse('$t2val'),
                      animate: true,
                      duration: Duration(seconds: 1),
                    ),
                  ),
                ],
              ),
            ),
             SizedBox(height: 14,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                Container(
                  margin: EdgeInsets.only(left: 40),
                   child:  Directionality(
                     textDirection: TextDirection.rtl,
                     child: Text('الخزان العلوي',
                         style:  GoogleFonts.cairo(
                           color:Colors.black,
                           fontSize: 24,
                           fontWeight: FontWeight.w700,
                         )
                     ),
                   ),
                 ),
                 Container(
                   margin: EdgeInsets.only(right: 40),
                   child:  Directionality(
                     textDirection: TextDirection.rtl,
                     child: Text('الخزان السفلي',
                         style:  GoogleFonts.cairo(
                           color:Colors.black,
                           fontSize: 24,
                           fontWeight: FontWeight.w700,
                         )
                     ),
                   ),
                 )
               ],
             )
            ]
        ),
      );
  }

  Future<void> _signOut() async{
    await FirebaseAuth.instance.signOut();
  }
}