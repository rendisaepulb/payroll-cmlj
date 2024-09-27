import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/paths.dart';

class AuthController extends GetxController {
  static AuthController get call => Get.find();

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  void validate() {
    if (key.currentState != null && key.currentState!.validate()) {
      Get.offAllNamed(Paths.home);
    }
  }
}
