import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthouse/signin.dart';
import '../color.dart';
import 'mainhomepage.dart';
import 'mainpage.dart';
class signuppage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  return _signuppagestate();
  }
}

class _signuppagestate extends State<signuppage>{
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  TextEditingController _textFieldController_phone=new TextEditingController();
  TextEditingController _textFieldController_password=new TextEditingController();
  bool iseye=false;
  @override
  Widget build(BuildContext context) {
    var screensize=MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: screensize.height*0.03,bottom: 0),
            child: Center(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Text('إنشاء حساب',
                  style:GoogleFonts.cairo(
                    color:Thintextcolor,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Image.asset('images/logo.png',
            width: 300,
            height: 200,
          ),
          SizedBox(height: 22,),
          Stack(
            children: [
              Container(
                height: screensize.height*0.89,
                width: screensize.width*0.99,
                margin: EdgeInsets.only(
                    left: screensize.width*0.04,
                    right: screensize.width*0.04
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Subthintextcolor),
                    borderRadius: BorderRadius.all(Radius.circular(12))
                ),
                child:  Form(
                  key: globalFormKey
                  ,child:Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 10,bottom: 10,right: 5),
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(right: 18),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text('اسم المستخدم',
                              style: GoogleFonts.cairo(
                               color:Thintextcolor,
                               fontSize: 16,
                             fontWeight: FontWeight.w600,
                               ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10,left: 10),
                          decoration: BoxDecoration(

                          ),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: new TextFormField(
                              textDirection: TextDirection.rtl,
                              controller: _textFieldController_phone,
                              textInputAction: TextInputAction.next,
                              style: GoogleFonts.cairo(
                              color:Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (input) => _textFieldController_phone.text = input!,
                              validator: (input) => input!.isEmpty ?
                              "phone number not valied" : null,
                              decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: borders)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: borders)),
                              ),
                            ),
                          ),
                        ),
                        //this is com fiedled
                        Container(
                          padding: EdgeInsets.only(top: 10,bottom: 10,right: 5),
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(right: 18),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text('الاسم',
                              style:GoogleFonts.cairo(
                                 color:Thintextcolor,
                                 fontSize: 16,
                              fontWeight: FontWeight.w600,
                                   ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10,left: 10),
                          decoration: BoxDecoration(
                          ),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: new TextFormField(
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              textInputAction: TextInputAction.next,
                              style:GoogleFonts.cairo(
                               color:Colors.black,
                             fontSize: 18,
                             fontWeight: FontWeight.w400,
                                   ),
                              keyboardType: TextInputType.name,
                              onSaved: (input) => _textFieldController_phone.text = input!,
                              validator: (input) => input!.isEmpty ? "name not valied" : null,
                              decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: borders)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: borders)),
                              ),
                            ),
                          ),
                        ),
                        //end comp fieled

                        //this is com fiedled 2
                        Container(
                          padding: EdgeInsets.only(top: 10,bottom: 10,right: 5),
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(right: 18),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text('الدولة',
                              style: GoogleFonts.cairo(
                                 color:Thintextcolor,
                                 fontSize: 16,
                                 fontWeight: FontWeight.w600,
                                 ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10,left: 10),
                          decoration: BoxDecoration(
                          ),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: new TextFormField(
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              textInputAction: TextInputAction.next,
                              style:GoogleFonts.cairo(
                                color:Colors.black,
                               fontSize: 18,
                               fontWeight: FontWeight.w400,
                                    ),
                              keyboardType: TextInputType.name,
                              onSaved: (input) => _textFieldController_phone.text = input!,
                              validator: (input) => input!.isEmpty ? "Password not valied" : null,
                              decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: borders)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: borders)),
                              ),
                            ),
                          ),
                        ),
                        //end comp fieled
                        //this is com fiedled
                        Container(
                          padding: EdgeInsets.only(top: 10,bottom: 10,right: 5),
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(right: 18),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text('الايميل' ,
                              style:GoogleFonts.cairo(
                                color:Thintextcolor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )
                              ,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5,left: 5),
                          decoration: BoxDecoration(
                          ),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: new TextFormField(
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              textInputAction: TextInputAction.next,
                              style: GoogleFonts.cairo(
                                color:Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (input) => _textFieldController_phone.text = input!,
                              validator: (input) => input!.isEmpty ?
                              "University ID Not valied" : null,
                              decoration: new InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: borders)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: borders)),
                              ),
                            ),
                          ),
                        ),
                        //end comp fieled

                        //this is com fiedled
                    Container(
                      width: screensize.width*0.99,
                      margin: EdgeInsets.only(
                          left: screensize.width*0.04,
                          right: screensize.width*0.04,
                      //
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(right: 5,left: 5),
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: InkWell(
                                onTap: (){
                                },
                                child: Text('use map',
                                  style: GoogleFonts.cairo(
                                    color:Butn,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  )
                                 ,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5,bottom: 5,right: 5,left: 5),
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(right: 5,left: 5),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text('كلمة المرور',
                                style:GoogleFonts.cairo(
                                color:Thintextcolor,
                                fontSize: 16,
                               fontWeight: FontWeight.w600,
                                     )
                                ,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                        Container(
                          margin: EdgeInsets.only(right: 5,left: 5),
                          decoration: BoxDecoration(
                          ),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: new TextFormField(
                              textAlign: TextAlign.right,
                              controller: _textFieldController_password,
                              textDirection: TextDirection.rtl,
                              textInputAction: TextInputAction.next,
                              style:  TextStyle(
                                color:borders,
                                fontSize: 18,
                                fontFamily: "Cairo",
                                fontWeight: FontWeight.w400,
                              ),
                              keyboardType: TextInputType.name,
                              onSaved: (input) => _textFieldController_phone.text = input!,
                              validator: (input) => input!.isEmpty ?
                              "Password not valied" : null,
                              decoration: new InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: borders)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: borders)),
                              ),
                              obscureText: true,
                            ),
                          ),
                        ),
                        //end comp fieled
                      ]
                  ) ,

                ),
              ),
              Container(
                width: screensize.width*0.99999,
                height: 50,
                margin: EdgeInsets.only(
                    top:  screensize.height*0.87,
                    right: screensize.width*0.15,
                    left:screensize.width*0.15),
                child: ElevatedButton(style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Butn),
                  elevation:MaterialStateProperty.all(12),
                  padding:MaterialStateProperty.all(EdgeInsets.all(5)),
                ), onPressed:() async{
    if (globalFormKey.currentState!.validate()) {
      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _textFieldController_phone.text,
            password:_textFieldController_password.text
        ).then((value) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => mainHomePage()));
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
                }, child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text('إنشاء حساب',
                    style: GoogleFonts.cairo(
                      color:Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                       )
                    ,
                  ),
                )),
              ),
            ],
          ),

          SizedBox(height: 30,),
          Container(
            margin:EdgeInsets.only(left: screensize.width*0.20) ,
            padding: EdgeInsets.only(left: 15,right: 15,top: 0,bottom: 5),
            child: Center(
                child: Row(
                  children: [
                   Container(
                     margin: EdgeInsets.only(right: 3,left: 3)
                     ,child: InkWell(
                       onTap: (){
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => Signin()));
                         }
                             ,
                        child: Directionality(
                        textDirection: TextDirection.rtl,
                          child: Text('تسجيل الدخول',
                            style:GoogleFonts.cairo(
                              color:Thintextcolor,
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                            )
                          ,
                          ),
                        ),
                      ),
                   ),
                    Container(
                      margin: EdgeInsets.only(right: 1,left: 1),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text('ليس لديك حساب؟',
                          style: GoogleFonts.cairo(
                            color:Subthintextcolor,
                            fontSize: 13,
                            fontWeight: FontWeight.w900,
                          )
                          ,
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }
  Future<bool> validateAndSave() async {
    await Future.delayed(Duration(seconds: 0));

    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
  void clearForm() {
    globalFormKey.currentState?.reset();
    _textFieldController_password.clear();
  }
}