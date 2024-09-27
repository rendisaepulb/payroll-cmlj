import 'package:flutter/material.dart';

import '../../widgets/drawer.dart';
import '../../widgets/employee_table.dart';

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees'),
        automaticallyImplyLeading: true,
      ),
      drawer: const CustomDrawer(),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            EmployeeTableWidget(),
          ],
        ),
      ),
    );
  }
}
