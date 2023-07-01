class ArtistModel {
  String name;
  String information;
  int? id;
 ArtistModel({ this.id,required this.name,required this.information});
 factory ArtistModel.fromMap(Map<String, dynamic> map) {
    return ArtistModel(
      name: map['artist_name'] ?? '',
      information: map['description'] ?? '',
     
     id: map['artist_id']??0,
   
    );
  } 
}
