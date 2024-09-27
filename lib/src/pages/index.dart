import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/index.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Payroll App',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      getPages: Routes.routes,
    );
  }
}
