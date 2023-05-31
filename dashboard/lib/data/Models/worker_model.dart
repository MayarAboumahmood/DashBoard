class WorkerModel {
  String name;
  String age;
  String numberPhone;
  String email;
  int id;
 WorkerModel({required this.id,required this.age,required this.email,required this.name,required this.numberPhone});
 factory WorkerModel.fromMap(Map<String, dynamic> map) {
    return WorkerModel(
      name: map['name'] ?? '',
      age: map['age'] ?? '',
      numberPhone: map['numberPhone'] ?? '',
      email: map['email'] ?? '',
     id: map['id'],
    );
  } 
}
