import 'package:get/get.dart';

import '../bindings/home_binding.dart';
import '../controllers/auth_controller.dart';
import '../controllers/employee_controller.dart';
import '../pages/employees/index.dart';
import '../pages/home/index.dart';
import '../pages/login/index.dart';
import '../pages/root/index.dart';
import 'paths.dart';

class Routes {
  static const initial = Paths.initial;
  static const login = Paths.login;
  static const home = Paths.home;
  static const employees = Paths.home + Paths.employees;

  static get routes {
    return [
      GetPage(
        name: Paths.initial,
        page: () => const RootPage(),
        children: [
          GetPage(
            name: Paths.login,
            page: () => const LoginPage(),
            binding: BindingsBuilder(
              () => Get.put<AuthController>(AuthController()),
            ),
          ),
          GetPage(
            name: Paths.home,
            page: () => const HomePage(),
            bindings: [HomeBinding()],
            children: [
              GetPage(
                name: Paths.employees,
                page: () => const EmployeesPage(),
                binding: BindingsBuilder(
                  () => Get.put<EmployeeController>(EmployeeController()),
                ),
              ),
            ],
          ),
        ],
      ),
    ];
  }
}
