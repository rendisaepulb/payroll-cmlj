import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/employee_controller.dart';
import '../../models/employee.dart';

class EditEmployeePage extends StatefulWidget {
  final EmployeeModel data;

  const EditEmployeePage(this.data, {super.key});

  @override
  State<EditEmployeePage> createState() => _EditEmployeePageState();
}

class _EditEmployeePageState extends State<EditEmployeePage> {
  String _name = '', _email = '', _gajiPokok = '';

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    setState(() {
      _name = widget.data.name;
      _email = widget.data.email;
      _gajiPokok = widget.data.gajiPokok.toString();
    });
  }

  void _onSave() async {
    EmployeeController.call.validate(
      widget.data.id!,
      name: _name,
      email: _email,
      gajiPokok: _gajiPokok,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: EmployeeController.call.key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                const Center(
                  child: Text(
                    'Edit Employee',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: _name,
              onChanged: (val) {
                setState(() {
                  _name = val;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Nama',
              ),
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Harap isi nama';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: _email,
              onChanged: (val) {
                setState(() {
                  _email = val;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Harap isi email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: _gajiPokok,
              onChanged: (val) {
                setState(() {
                  _gajiPokok = val;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Gaji Pokok',
              ),
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Harap isi gaji pokok';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),
            Obx(() {
              final loading = EmployeeController.call.loading.value;
              return ElevatedButton(
                onPressed: loading ? null : _onSave,
                child: Center(
                  child: loading
                      ? const CircularProgressIndicator.adaptive()
                      : const Text('Simpan'),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
