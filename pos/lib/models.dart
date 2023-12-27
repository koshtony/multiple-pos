class Stocks {
  final String serial;
  final String name;
  final int qty;
  final double price;
  final double cost;
  final String image;

  Stocks(
      {required this.serial,
      required this.name,
      required this.qty,
      required this.price,
      required this.cost,
      required this.image});

  Map toJson() {
    return {
      "serial": serial,
      "name": name,
      "qty": qty,
      "price": price,
      "cost": cost,
      "image": image,
    };
  }
}
