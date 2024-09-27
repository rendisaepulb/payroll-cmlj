import 'package:flutter/material.dart' show Colors, FormState, GlobalKey;
import 'package:get/get.dart';

import '../models/employee.dart';
import '../pages/employees/edit_employee.dart';
import 'db_controller.dart';

class EmployeeController extends GetxController {
  static EmployeeController get call => Get.find();

  final employees = <EmployeeModel>[].obs;

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  final loading = false.obs;

  void validate(
    String userId, {
    String name = '',
    String email = '',
    String gajiPokok = '',
  }) {
    if (key.currentState != null && key.currentState!.validate()) {
      onSaveEmployee(
        userId,
        name: name,
        email: email,
        gajiPokok: gajiPokok,
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    DBController.readData();
  }

  void editEmployee(EmployeeModel data) async {
    Get.bottomSheet(
      EditEmployeePage(data),
      isScrollControlled: true,
      backgroundColor: Colors.white,
    );
  }

  Future<void> onSaveEmployee(
    String userId, {
    String name = '',
    String email = '',
    String gajiPokok = '',
  }) async {
    loading.value = true;
    final body = {'name': name, 'email': email, 'gaji_pokok': gajiPokok};

    await DBController.updateData(userId, body);
    loading.value = false;
    Get.back();
  }
}
