class EventModel {
  String title;
  String description;
  int ticketPrice;
  int availablePlaces;
  String bandName;
  String beginDate;
  int? adminId;

  EventModel(
      {required this.title,
      required this.availablePlaces,
      required this.beginDate,
      required this.description,
      required this.ticketPrice,
      this.adminId,
      required this.bandName});
  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      title: map['title'] ?? '',
      availablePlaces: map['available_places'] ?? '',
      beginDate: map['begin_date'] ?? '',
      description: map['description'] ?? '',
      ticketPrice: map['ticket_price'] ?? 0,
      bandName: map['band_name'] ?? '',
    );
  }
}
