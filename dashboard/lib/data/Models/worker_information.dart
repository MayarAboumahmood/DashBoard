import 'event_model.dart';

class WorkerInformationModel {
  String firstName;
  String lastName;
  String numberPhone;
  String email;
  String? image;
  int? id;
  List<EventModel>? events;
 WorkerInformationModel({this.events,this.image, this.id,required this.email,required this.lastName,required this.firstName,required this.numberPhone});
 factory WorkerInformationModel.fromMap(Map<String, dynamic> map) {
//   List<EventModel> eventModelList=[];
//  for (var i = 0; i < map['events'].length; i++) {
//    eventModelList.add(EventModel.fromMap(map['events'][i]));
//  }
 final eventJson = map['events'] as List<dynamic>;
    final finalEventJson = eventJson
        .map((drinkJson) => EventModel.fromMap(drinkJson))
        .toList();

 print(finalEventJson);
    return WorkerInformationModel(
      firstName: map['worker']['first_name'] ?? '',
      lastName: map['worker']['last_name'] ?? '',
      numberPhone: map['worker']['phone_number'] ?? '',
      email: map['worker']['email'] ?? '',
     id: map['worker']['worker_id']??0,
     events: finalEventJson,
     image: map['worker']['image']??''
    );
  } 
}
