class EventInfoModel {
  bool status;
  String message;
  EventData data;

  EventInfoModel({required this.status,required this.message,required this.data});

  factory EventInfoModel.fromJson(Map<String, dynamic> json) {
    return EventInfoModel(
      status: json['status'],
      message: json['message'],
      data: EventData.fromJson(json['data']),
    );
  }
}

class EventData {
  Event event;
  List<Reservation> reservations;

  EventData({required this.event,required this.reservations});

  factory EventData.fromJson(Map<String, dynamic> json) {
    return EventData(
      event: Event.fromJson(json['event']),
      reservations: List<Reservation>.from(
          json['reservations'].map((x) => Reservation.fromJson(x))),
    );
  }
}

class Event {
  int eventId;
  String title;
  String description;
  int ticketPrice;
  int availablePlaces;
  String bandName;
  String beginDate;
  int artistsCost;
  String createdAt;
  String updatedAt;
  int adminId;
  List<Photo> photos;
  List<ArtistEvent> artistEvents;

  Event({
   required this.eventId,
   required this.title,
   required this.description,
   required this.ticketPrice,
   required this.availablePlaces,
   required this.bandName,
   required this.beginDate,
   required this.artistsCost,
   required this.createdAt,
   required this.updatedAt,
   required this.adminId,
   required this.photos,
   required this.artistEvents,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventId: json['event_id'],
      title: json['title'],
      description: json['description'],
      ticketPrice: json['ticket_price'],
      availablePlaces: json['available_places'],
      bandName: json['band_name'],
      beginDate: json['begin_date'],
      artistsCost: json['artists_cost'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      adminId: json['admin_id'],
      photos: List<Photo>.from(json['photos'].map((x) => Photo.fromJson(x))),
      artistEvents: List<ArtistEvent>.from(
          json['artist_events'].map((x) => ArtistEvent.fromJson(x))),
    );
  }
}

class Photo {
  int photoId;
  String picture;
  String createdAt;
  String updatedAt;
  int eventId;

  Photo({
   required this.photoId,
   required this.picture,
   required this.createdAt,
   required this.updatedAt,
   required this.eventId,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      photoId: json['photo_id'],
      picture: json['picture'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      eventId: json['event_id'],
    );
  }
}

class ArtistEvent {
  int artistEventId;
  String createdAt;
  String updatedAt;
  int artistId;
  int eventId;
  Artist artist;

  ArtistEvent({
   required this.artistEventId,
   required this.createdAt,
   required this.updatedAt,
   required this.artistId,
   required this.eventId,
   required this.artist,
  });

  factory ArtistEvent.fromJson(Map<String, dynamic> json) {
    return ArtistEvent(
      artistEventId: json['artist_event_id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      artistId: json['artist_id'],
      eventId: json['event_id'],
      artist: Artist.fromJson(json['artist']),
    );
  }
}

class Artist {
  int artistId;
  String artistName;
  String description;
  String createdAt;
  String updatedAt;

  Artist({
   required this.artistId,
   required this.artistName,
   required this.description,
   required this.createdAt,
   required this.updatedAt,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      artistId: json['artist_id'],
      artistName: json['artist_name'],
      description: json['description'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class Reservation {
  int? reservationId;
  bool? attendance;
  int numberOfPlaces;
  dynamic attendanceNumber;
  dynamic sectionNumber;
  String customerName;
  String? createdAt;
  String ?updatedAt;
  int? eventId;
  dynamic customerId;
  dynamic workerId;
  dynamic worker;
  List<Order>? orders;

  Reservation({
     this.reservationId,
     this.attendance,
    required this.numberOfPlaces,
    this.attendanceNumber,
    this.sectionNumber,
   required this.customerName,
    this.createdAt,
    this.updatedAt,
    this.eventId,
    this.customerId,
    this.workerId,
    this.worker,
    this.orders,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      reservationId: json['reservation_id'],
      attendance: json['attendance'],
      numberOfPlaces: json['number_of_places'],
      attendanceNumber: json['attendance_number'],
      sectionNumber: json['section_number'],
      customerName: json['customer_name'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      eventId: json['event_id'],
      customerId: json['customer_id'],
      workerId: json['worker_id'],
      worker: json['worker'],
      orders: List<Order>.from(json['orders'].map((x) => Order.fromJson(x))),
    );
  }
}

class Order {
  int orderId;
  String orderDate;
  dynamic description;
  String createdAt;
  String updatedAt;
  dynamic workerEventId;
  int reservationId;
  List<OrderDrink> orderDrinks;

  Order({
   required this.orderId,
   required this.orderDate,
    this.description,
    required this.createdAt,
    required this.updatedAt,
    this.workerEventId,
   required this.reservationId,
   required this.orderDrinks,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['order_id'],
      orderDate: json['order_date'],
      description: json['description'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      workerEventId: json['worker_event_id'],
      reservationId: json['reservation_id'],
      orderDrinks: List<OrderDrink>.from(
          json['order_drinks'].map((x) => OrderDrink.fromJson(x))),
    );
  }
}

class OrderDrink {
  int orderDrinkId;
  int quantity;
  String createdAt;
  String updatedAt;
  int orderId;
  int drinkId;

  OrderDrink({
    required this.orderDrinkId,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
    required this.orderId,
    required this.drinkId,
  });

  factory OrderDrink.fromJson(Map<String, dynamic> json) {
    return OrderDrink(
      orderDrinkId: json['order_drink_id'],
      quantity: json['quantity'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      orderId: json['order_id'],
      drinkId: json['drink_id'],
    );
  }
}
