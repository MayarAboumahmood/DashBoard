class  AdminModel{
String name;
String email;
bool? isSuper;
int? id;
AdminModel({this.id,required this.name, this.isSuper,required this.email});
factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(
      name: map['admin_name'] ?? '',
       email: map['email'] ?? '',
     id: map['id']??0,
     isSuper: map['is_super']??false
    );
  }
}