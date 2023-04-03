import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:smarthouse/report.dart';
import 'contactus.dart';
import 'mainpage.dart';

class NavbarController extends GetxController{
  final RxInt  _index = 0.obs;
  List widgets = [
    mainpage(),
    report(),
    contactus(),
  ];
  RxInt get index => _index;

  void next(int index){
    _index.value = index;
  }
}