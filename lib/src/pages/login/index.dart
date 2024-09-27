import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../assets/images.dart';
import '../../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final widthSize = Get.size.width;
    final con = AuthController.call;
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: widthSize * 0.8,
          child: Form(
            key: con.key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  MyImages.appLogo,
                  width: 60,
                  height: 60,
                ),
                const SizedBox(height: 32),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                  autofillHints: const [AutofillHints.username],
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Fill field password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Fill field password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    con.validate();
                  },
                  child: const Center(child: Text('Login')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
