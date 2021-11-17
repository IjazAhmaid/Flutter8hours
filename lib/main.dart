import 'package:flutter/material.dart';
import 'package:project8hours/pages/home_page.dart';
//import 'package:project8hours/pages/home_page.dart';
import 'package:project8hours/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //home: const HomePage(),
        themeMode: ThemeMode.light,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        darkTheme: ThemeData(brightness: Brightness.dark),
        initialRoute: "/home",
        routes: {
          "/": (context) => const LoginPage(),
          "/home": (context) => const HomePage(),
        });
  }
}
