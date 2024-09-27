import 'package:get/get.dart';

import '../controllers/employee_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<EmployeeController>(EmployeeController());
    Get.put<HomeController>(HomeController());
  }
}
