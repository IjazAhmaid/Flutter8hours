import 'package:flutter/material.dart';
import 'package:project8hours/models/catalog.dart';

class Itemwidget extends StatelessWidget {
  const Itemwidget({Key? key, required this.item}) : super(key: key);
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Card(
      //shape: StadiumBorder(),
      // color: Colors.red,
      elevation: 0.0,
      child: ListTile(
        onTap: () {},
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 1.5,
          style: const TextStyle(
              color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
