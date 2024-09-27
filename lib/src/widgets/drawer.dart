import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../assets/images.dart';
import '../routes/index.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(
              MyImages.appLogo,
              width: 32,
              height: 32,
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Get.toNamed(Routes.home);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Employee'),
            onTap: () {
              Get.toNamed(Routes.employees);
            },
          ),
          const Divider(),
          ListTile(
            textColor: Colors.red,
            title: const Text('Logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
