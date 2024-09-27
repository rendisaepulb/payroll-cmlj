import 'package:firebase_database/firebase_database.dart';

import '../models/employee.dart';
import 'employee_controller.dart';

class DBController {
  static void createRecord() {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref().child('employees');

    databaseReference.push().set(
          EmployeeModel(
            name: 'John Smith',
            email: 'john@gmail.com',
            nik: '04983838',
            role: 'SVP',
            npwp: '0958383938',
            gajiPokok: 7900000,
            tunKeahlian: 300000,
            tunMakan: 100000,
            tunLain: 20000,
            masukLanjut: 0,
            lemburNasional: 0,
            bpjsNaker: 69000,
            pensiun: 32000,
            bpjsKesehatan: 34000,
            kehadiran: 0,
          ).toJson(),
        );
  }

  static void readData() {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref().child('employees');

    databaseReference.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      final values = dataSnapshot.value;

      if (values != null) {
        final map = (values as Map).cast();
        List<EmployeeModel> list = [];
        map.forEach((key, value) {
          final parsed = {
            'id': key,
            ...value,
          };
          final employee = EmployeeModel.fromJson(parsed);
          list.add(employee);
        });
        EmployeeController.call.employees.value = list;
      }
      // return values;
    });
  }

  static Future<void> updateData(String id, Map<String, dynamic> body) async {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref().child('employees');

    await databaseReference.child(id).update(body);
  }
}
