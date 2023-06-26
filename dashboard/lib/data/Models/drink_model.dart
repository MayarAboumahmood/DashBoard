class DrinkModel {
  String name;
  String price;
  String image;
  String bottlePrice;
  int quantity;
  int id;
  DrinkModel(
      {required this.bottlePrice,
      required this.id,
      required this.image,
      required this.name,
      required this.price,
      required this.quantity}
      );

      factory DrinkModel.fromMap(Map<String, dynamic> map) {
    return DrinkModel(
      name: map['name'] ?? '',
      price: map['price'] ?? '',
      bottlePrice: map['bottle_price'] ?? '',
      quantity: map['quantity'] ?? '',
     id: map['worker_id']??0,
     image: map['image']??''
    );
  } 
}
