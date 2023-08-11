class EventModel {
  String title;
  String description;
  int ticketPrice;
  int availablePlaces;
  String bandName;
  String beginDate;
  int? adminId;
  String image;
  int id;

  EventModel(
      {required this.title,
      required this.availablePlaces,
      required this.beginDate,
      required this.description,
      required this.ticketPrice,
      required this.image,
      this.adminId,
      required this.bandName,
      required this.id
      });
  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      title: map['title'] ?? '',
      availablePlaces: map['available_places'] ?? '',
      beginDate: map['begin_date'] ?? '',
      description: map['description'] ?? '',
      ticketPrice: map['ticket_price'] ?? 0,
      bandName: map['band_name'] ?? '',
      id:map['event_id']??0,
      image: map['image']??'assets/images/The project icon.jpg'
    );
  }
}
