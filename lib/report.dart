import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthouse/splashscreen.dart';
import 'color.dart';
import 'mainpage.dart';

class report extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _reportstate();
  }
}
class _reportstate extends State<report>{
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
          Card (
            margin: EdgeInsets.only(right: 10,left: 10),
            borderOnForeground: false,
            elevation: 17,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: InkWell(
              onTap:(){
                print('done');
              },
              child: Container(
                height: 100,
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
                        child:Text('${t1val}',
                          style:GoogleFonts.cairo(
                            color:Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.w900,
                          )
                          ,
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text('مستوى الماء في الجزء العلوي من الخزان',
                          style:GoogleFonts.cairo(
                            color:Colors.black,
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
                        child: Icon(FontAwesomeIcons.arrowUpFromWaterPump),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          ///second
          SizedBox(height: 25,),
          Card(
            margin: EdgeInsets.only(right: 10,left: 10),
            borderOnForeground: false,
            elevation: 17,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: InkWell(
              onTap:(){
                print('done second');
              },
              child: Container(
                height: 100,
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
                        child: Text('${t2val}',
                          style:GoogleFonts.cairo(
                            color:Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.w900,
                          )
                          ,
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text('مستوى الماء في الجزء السفلي من الخزان',
                          style:GoogleFonts.cairo(
                            color:Colors.black,
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
                        child: Icon(FontAwesomeIcons.bottleWater),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          /// pumb state
          SizedBox(height: 25,),
          Card(
            margin: EdgeInsets.only(right: 10,left: 10),
            borderOnForeground: false,
            elevation: 17,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: InkWell(
              onTap:(){
                print('done');
              },
              child: Container(
                height: 100,
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
                        child: Text('${t5val}',
                          style:GoogleFonts.cairo(
                            color:Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.w900,
                          )
                          ,
                        ),
                      ),
                    ),
                    SizedBox(width: 160,),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text('حالة المضخة',
                          style:GoogleFonts.cairo(
                            color:Colors.black,
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
                        child: Icon(FontAwesomeIcons.gasPump),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future<void> _signOut() async{
    await FirebaseAuth.instance.signOut();
  }
}