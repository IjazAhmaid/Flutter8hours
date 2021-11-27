class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}

class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "ijaz",
        desc: "ijaz maitla",
        price: 345,
        color: "black",
        image: "https://picsum.photos/250?image=9")
  ];
}
