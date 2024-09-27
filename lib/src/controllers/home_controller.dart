import 'package:get/get.dart';

import '../models/employee.dart';
import 'employee_controller.dart';
import 'pdf_controller.dart';

class HomeController extends GetxController {
  static HomeController get call => Get.find();

  final generateLoading = false.obs;

  void generatePDF(EmployeeModel data) async {
    PdfController.generatePdf(data);
  }

  void generatePDFs() async {
    final employees = EmployeeController.call.employees;

    if (employees.isEmpty) return;

    generateLoading.value = true;

    for (var data in employees) {
      await PdfController.generatePdf(data);
    }

    generateLoading.value = false;
  }
}
