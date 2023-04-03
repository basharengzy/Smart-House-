import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color.dart';
Icon customIconNav(IconData icon) {
  return Icon(
    icon,
    size: 25,
    color: Colors.white,
  );
}

Widget customIconNavHome(IconData icon) {
  return Container(
    width: 25,
    height: 25,
    decoration: const BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
    ),
    child: Icon(
      icon,
      size: 25,
      color: Colors.black,
    ),
  );
}

Widget customButtonAppBar({IconData? icon, Function? onTab}) {
  return GestureDetector(
    onTap: () {},
    child: Padding(
      padding: EdgeInsets.all(8),
      child: CircleAvatar(
        backgroundColor: const Color.fromRGBO(229, 229, 229, 1),
        child:Icon(
          icon,
          size: 8,
          color: Colors.black,
        ),
      ),
    ),
  );
}

Widget customRoundButton({IconData? icon, String? text}) {
  return Padding(
    padding: const EdgeInsets.all(1),
    child: Container(
      // width: 18,
      //height: 5,
        decoration: const BoxDecoration(
          // color: Color.fromRGBO(229, 229, 229, 1),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 3),
              child: Icon(
                icon,
                size: 25,
                color: Thintextcolor,
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            Text(
              text!,
              style:  GoogleFonts.cairo(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        )),
  );
}


