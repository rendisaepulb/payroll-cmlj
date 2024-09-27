import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'firebase_options.dart';
import 'src/pages/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDateFormatting();

  // final firebaseApp = Firebase.app();
  FirebaseDatabase.instance.databaseURL =
      'https://payroll-app-6133c-default-rtdb.asia-southeast1.firebasedatabase.app/';
  runApp(const MyApp());
}
