
import 'package:get/get.dart';
import 'package:passplus/controller/authtentcate_controller.dart';
import 'package:passplus/controller/listuspass_controller.dart';

class HomeScreenBinding implements Bindings  {
  @override
  void dependencies() {
    Get.put(ListuspassController());
    Get.put(AuthentcationController());
    
  }
  

  

}