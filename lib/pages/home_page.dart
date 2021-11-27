import 'package:flutter/material.dart';
import 'package:project8hours/models/catalog.dart';
import 'package:project8hours/widgets/drawer.dart';
import 'package:project8hours/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final int days = 30;
  final String name = 'ijaz';
  @override
  Widget build(BuildContext context) {
    final dummylist = List.generate(220, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalog App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView.builder(
            itemCount: dummylist.length,
            itemBuilder: (context, index) {
              return Itemwidget(
                item: dummylist[index],
              );
            }),
      ),
      drawer: const MyDrawer(),
    );
  }
}
