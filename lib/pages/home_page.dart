import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:project8hours/models/catalog.dart';
import 'package:project8hours/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = 'ijaz';
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    // await Future.delayed(const Duration(seconds: 4));
    final models12 = await rootBundle.loadString("assets/files/models1.json");
    final decodedData = jsonDecode(models12);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalog App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        /* ListView.builder(
              itemCount: CatalogModel.items.length,
              itemBuilder: (context, index) => Itemwidget(
                    item: CatalogModel.items[index],
                  )) */
        child: GridView.builder(
            itemCount: CatalogModel.items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              final item = CatalogModel.items[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: GridTile(
                  header: Container(
                    child: Text(
                      item.name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(color: Colors.deepPurple),
                  ),
                  child: Image.network(item.image),
                  footer: Container(
                    child: Text(
                      item.price.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(color: Colors.black),
                  ),
                ),
              );
            }),
      ),
      drawer: const MyDrawer(),
    );
  }
}
