import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/drawer.dart';
import '../../widgets/employee_table.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payroll'),
        automaticallyImplyLeading: true,
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () {
                  // HomeController.call.generatePDFs();
                  Get.bottomSheet(
                    const Center(
                      child: Text('Cooming Soon'),
                    ),
                    backgroundColor: Colors.white,
                  );
                },
                child: const Text('Kirim semua lewat email'),
              ),
            ),
            const SizedBox(height: 32),
            const EmployeeTableWidget(),
          ],
        ),
      ),
    );
  }
}
