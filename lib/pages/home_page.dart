import 'package:flutter/material.dart';
import 'package:project8hours/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final int days = 30;
  final String name = 'ijaz';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalog App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Text('Well come to $days day of flutter by $name'),
      ),
      drawer: const MyDrawer(),
    );
  }
}
