import 'package:firebase_chat_app/presentation/pages/auth/register_page.dart';
import 'package:firebase_chat_app/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import '../../presentation/pages/auth/login_page.dart';
import '../../presentation/pages/splash/splash_page.dart';
import 'app_routes.dart';

class AppPages {
  static Map<String, WidgetBuilder> routes = {
    AppRoutes.splash: (_) => const SplashPage(),
    AppRoutes.login: (_) =>  LoginPage(),
    AppRoutes.register: (_) =>  RegisterPage(),
    AppRoutes.home: (_) =>  HomePage(),
  };
}