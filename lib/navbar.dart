import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../color.dart';
import 'customroundedbtn.dart';
import 'navcontroller.dart';


class CustomNavigation extends StatelessWidget {
  CustomNavigation({Key? key, Function(int index)? onTab}) : super(key: key);
  final NavbarController _navbarController = Get.put(NavbarController());

  @override
  Widget build(BuildContext context) {
    var screensize=MediaQuery.of(context).size;

    return Obx(() => Container(
      padding: EdgeInsets.all(0.7),
      height:screensize.height*0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:Butn,
      ),
      width: Get.width,
      margin: const EdgeInsets.only(bottom: 15,right: 8,left: 8,top: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 15,),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: GestureDetector(
                child:customRoundButton(icon: _navbarController.index==0?
                FontAwesomeIcons.gasPump:
                FontAwesomeIcons.pumpSoap,text: 'الرئيسية'
                ),
                onTap:(){
                  _navbarController.next(0);
                },
              ),
            ),

          SizedBox(width: screensize.width*0.27,),
            Align(
                alignment: AlignmentDirectional.center,
        child:GestureDetector(
              child:customRoundButton(icon: _navbarController.index==1?
              FontAwesomeIcons.fileExcel
                  :FontAwesomeIcons.file,text: 'التقارير'),
              onTap:(){
                _navbarController.next(1);
              },
            )),
            SizedBox(width: screensize.width*0.27,),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: GestureDetector(
                child:customRoundButton(icon: _navbarController.index==2?
                FontAwesomeIcons.phoneVolume
                    :FontAwesomeIcons.phone,text: 'اتصل بنا'),
                onTap:(){
                  _navbarController.next(2);
                },
              ),
            ),
           SizedBox(width: 15,),
          ],
        ),
      ),
    ));
  }
}
