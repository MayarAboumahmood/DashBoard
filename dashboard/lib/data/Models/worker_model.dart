class WorkerModel {
  String firstName;
  String lastName;
  String numberPhone;
  String email;
  String? image;
  int? id;
 WorkerModel({this.image, this.id,required this.email,required this.lastName,required this.firstName,required this.numberPhone});
 factory WorkerModel.fromMap(Map<String, dynamic> map) {
    return WorkerModel(
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      numberPhone: map['numberPhone'] ?? '',
      email: map['email'] ?? '',
     id: map['worker_id']??0,
     image: map['image']??''
    );
  } 
}
