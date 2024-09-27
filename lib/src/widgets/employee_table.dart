import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/employee_controller.dart';
import '../controllers/home_controller.dart';
import '../utils/utils.dart';

class EmployeeTableWidget extends StatelessWidget {
  const EmployeeTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // ignore: invalid_use_of_protected_member
      final employees = EmployeeController.call.employees.value;
      return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 24,
          columns: const [
            DataColumn(
                label: Text(
              'NIK',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'Nama',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'Email',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'Jabatan',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'NPWP',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'Gaji Pokok',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'Tunjangan Keahlian',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'Tunjangan Makan',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'Tunjangan Lain-lain',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'Masuk Lanjut',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'Lembur Nasional',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'BPJS Naker',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'Jaminan Pensiun',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'BPJS Kesehatan',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'Kehadiran',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'Action',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ],
          rows: [
            for (var data in employees)
              DataRow(cells: [
                DataCell(Text(data.nik ?? '-')),
                DataCell(Text(data.name)),
                DataCell(Text(data.email)),
                DataCell(Text(data.role ?? '-')),
                DataCell(Text(data.npwp ?? '-')),
                DataCell(Text(Utils.getCurrency(data.gajiPokok))),
                DataCell(Text(Utils.getCurrency(data.tunKeahlian))),
                DataCell(Text(Utils.getCurrency(data.tunMakan))),
                DataCell(Text(Utils.getCurrency(data.tunLain))),
                DataCell(Text(Utils.getCurrency(data.masukLanjut))),
                DataCell(Text(Utils.getCurrency(data.lemburNasional))),
                DataCell(Text(Utils.getCurrency(data.bpjsNaker))),
                DataCell(Text(Utils.getCurrency(data.pensiun))),
                DataCell(Text(Utils.getCurrency(data.bpjsKesehatan))),
                DataCell(Text(Utils.getCurrency(data.kehadiran))),
                DataCell(Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit_document),
                      tooltip: 'Edit',
                      onPressed: () {
                        EmployeeController.call.editEmployee(data);
                      },
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.file_download),
                      tooltip: 'Download',
                      onPressed: () {
                        HomeController.call.generatePDF(data);
                      },
                    ),
                  ],
                )),
              ]),
          ],
        ),
      );
    });
  }
}
