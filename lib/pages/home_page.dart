import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:project8hours/models/catalog.dart';
import 'package:project8hours/widgets/thems.dart';

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
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [const CatalogHeader(), const CatalogList().expand()],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending Product".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return CatalogItem(catalog: catalog);
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(
          image: catalog.image,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.bold.lg.color(MyTheme.darkBluishColor).make(),
              catalog.desc.text.make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}"
                      .text
                      .bold
                      .lg
                      .color(MyTheme.darkBluishColor)
                      .make(),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              MyTheme.darkBluishColor),
                          shape:
                              MaterialStateProperty.all(const StadiumBorder())),
                      onPressed: () {},
                      child: "Buy".text.make())
                ],
              ).pOnly(right: 16)
            ],
          ),
        )
      ],
    )).white.rounded.square(140).make().py(16);
  }
}

class CatalogImage extends StatelessWidget {
  const CatalogImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(MyTheme.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}


/*
Padding(
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
*/
