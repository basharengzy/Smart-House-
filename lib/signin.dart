import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthouse/signuppage.dart';
import '../color.dart';
import 'mainhomepage.dart';
import 'mainpage.dart';
class Signin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _Signinstate();
  }
}
final scaffoldKey = GlobalKey<ScaffoldState>();
class _Signinstate extends State<Signin>{
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  TextEditingController _textFieldController_phone=new TextEditingController();
   TextEditingController _textFieldController_password=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screensize=MediaQuery.of(context).size;

    /// Form ====================================================


    @override
    void initState() {
      super.initState();
      _textFieldController_phone = new TextEditingController();
      _textFieldController_password = new TextEditingController();

    }
    bool iseye=false;
  return Scaffold(
    body: ListView(
      children: [
        Container(
          margin: EdgeInsets.only(top: screensize.height*0.03,bottom: 0),
          child: Align(
            child:Container(
              margin: EdgeInsets.only(left: 30,right: 50),
              width: 200,
              height: 200,
              child: Image.asset('images/logo.png',
                width: 200,
                height: 200,
              ),
            ),
          ),
        ),
         SizedBox(height: 22,),
         Stack(
           children: [
           Container(
           height: screensize.height*0.49,
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
      key: globalFormKey,
    child:Column(
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
        )
         ,
         ),
         ),
         ),
    Container(
      margin: EdgeInsets.only(right: 10,left:10),
    decoration: BoxDecoration(
    border: Border.all(
    color: borders,
        width:2,
    )
    ),
    child: Directionality(
    textDirection: TextDirection.rtl,
    child: new TextFormField(
    textDirection: TextDirection.rtl,
   textInputAction: TextInputAction.next,
    controller: _textFieldController_phone,
    style: GoogleFonts.cairo(
      color:Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    textAlign: TextAlign.right,
    keyboardType: TextInputType.emailAddress,
    onSaved: (input) => _textFieldController_phone.text = input!,
    validator: (input) => input!.isEmpty ? "Your email not vailed" : null,
    decoration: new InputDecoration(
    labelText: 'examble@gmail.com',
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: borders)),
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: borders)),
    suffixIcon:Icon(Icons.email,
    color: Colors.black,
    )
    ),
    ),
    ),
    ),
    Container(
      padding: EdgeInsets.only(top: 10,bottom: 10,right: 5),
    alignment: Alignment.topRight,
    margin: EdgeInsets.only(right: 18),
    child: Directionality(
      textDirection: TextDirection.rtl,
      child: Text('كلمة المرور',
      style: GoogleFonts.cairo(
    color:Thintextcolor,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    ),
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
    controller: _textFieldController_password,
    obscureText: true,
    textDirection: TextDirection.rtl,
    textInputAction: TextInputAction.next,
    style:GoogleFonts.cairo(
    color:Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    )
    ,
    keyboardType: TextInputType.name,
    onSaved: (input) => _textFieldController_phone.text = input!,
    validator: (input) => input!.isEmpty ? "Password not right" : null,
    decoration: new InputDecoration(
    labelText: 'كلمة المرور',
    enabledBorder:OutlineInputBorder(
    borderSide: BorderSide(color: borders)),
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: borders)),
    suffixIcon: InkWell(
    child: iseye==true?Icon(Icons.remove_red_eye_rounded,
    color: Colors.black
    ):Image.asset("images/noteye.png"),
    onTap: (){
    setState(() {
    iseye=!iseye;
    print('iseye =====$iseye');
    });
    },
    )
    ),
    ),
    ),
    ),
SizedBox(height: 15,),
      Container(
        margin: EdgeInsets.only(left: 20,right: 5),
        width: screensize.width*0.99,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(right: 30),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Text('هل نسيت كلمة المرور',
                  style:GoogleFonts.cairo(
                  color:Thintextcolor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                          ),
                ),
              ),
            ),

          ],
        ),
      )

    ]
    ) ,

    ),
    ),
    Container(
               width: screensize.width*0.99999,
               height: 50,
               margin: EdgeInsets.only(
                   top:  screensize.height*0.47,
                   right: screensize.width*0.15,
                   left:screensize.width*0.15),
               child: ElevatedButton(style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all(Butn),
                 elevation:MaterialStateProperty.all(12),
                 padding:MaterialStateProperty.all(EdgeInsets.all(5)),
               ), onPressed:() async{
               if (globalFormKey.currentState!.validate()) {
                 try {
                   final credential = await FirebaseAuth.instance.
                   signInWithEmailAndPassword(
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
                 child: Text('تسجيل الدخول',
                   style:GoogleFonts.cairo(
                   color:Colors.white,
                   fontSize: 16,
                   fontWeight: FontWeight.w600,
                    ),
                  ),
                   )),
                   ),
              ],
       ),

      SizedBox(height: 90,),
        Container(
          margin:EdgeInsets.only(left:
          screensize.width*0.20) ,
          child: Center(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 3,right: 3)
                  ,child: InkWell(
                     onTap: (){
                     Navigator.push(context,
                     MaterialPageRoute(builder:  (context) =>
                         signuppage()));
                         },
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text('تسجيل حساب',
                        style: GoogleFonts.cairo(
                          color:Thintextcolor,
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
                  //ليس لديك حساب
                   Container(
                     margin: EdgeInsets.only(left: 3,right: 3),
                     child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text('ليس لد يك حساب',
                        style: GoogleFonts.cairo(
                          color:Subthintextcolor,
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                        ),
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