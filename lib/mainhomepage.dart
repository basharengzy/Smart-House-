import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'navbar.dart';
import 'navcontroller.dart';
class mainHomePage extends StatelessWidget {
  mainHomePage({Key? key}) : super(key: key);
  final NavbarController _navbarController = Get.put(NavbarController());

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomNavigation(),
      body:_navbarController.widgets[_navbarController.index.value],
    ));
  }
}
