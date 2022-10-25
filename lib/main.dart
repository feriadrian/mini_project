import 'package:flutter/material.dart';
import 'package:mini_projeck/pages/home_page/component/list_cover_gridview.dart';
import 'package:mini_projeck/pages/home_page/home_page.dart';
import 'package:mini_projeck/pages/login_page/login_page.dart';
import 'package:mini_projeck/pages/spalsh_page/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
