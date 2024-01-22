import 'package:clock_in_app/pages/authentication/login_page.dart';
import 'package:clock_in_app/pages/authentication/signup_page.dart';
import 'package:clock_in_app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static const loginIn = AppRoutes.loginPage;
  static const signUp = AppRoutes.signupPage;
  static final pageList = [
    GetPage(
      name: AppRoutes.loginPage,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: AppRoutes.signupPage,
      page: () => const SignUpPage(),
    ),
  ];
}
