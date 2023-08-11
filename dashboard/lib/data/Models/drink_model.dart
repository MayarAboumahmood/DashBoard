class DrinkModel {
  String name;
  double price;
  String image;
  String description;
  double cost;
  int quantity;
  int id;
  DrinkModel(
      {required this.cost,
      required this.description,
      required this.id,
      required this.image,
      required this.name,
      required this.price,
      required this.quantity}
      );

      factory DrinkModel.fromMap(Map<String, dynamic> map) {
    return DrinkModel(
      name: map['title'] ?? '',
      price: map['price'] ?? 0,
      cost: map['cost'] ?? 0,
      quantity: map['quantity'] ?? 0,
      description: map['description']??'',
     id: map['drink_id']??0,
     image: map['picture']??''
    );
  } 
}
