class Event {
  final int eventId;
  final String title;
  final String description;
  final int ticketPrice;
  final int availablePlaces;
  final String bandName;
  final String beginDate;
  final int artistsCost;
  final String createdAt;
  final String updatedAt;
  final int adminId;
  final List<Photo> photos;
  final List<ArtistEvent> artistEvents;
  final List<WorkerEvent> workerEvents;

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
    required this.workerEvents,
  });
}

class Photo {
  final int photoId;
  final String picture;
  final String createdAt;
  final String updatedAt;
  final int eventId;

  Photo({
    required this.photoId,
    required this.picture,
    required this.createdAt,
    required this.updatedAt,
    required this.eventId,
  });
}

class ArtistEvent {
  final int artistEventId;
  final String createdAt;
  final String updatedAt;
  final int artistId;
  final int eventId;
  final Artist artist;

  ArtistEvent({
    required this.artistEventId,
    required this.createdAt,
    required this.updatedAt,
    required this.artistId,
    required this.eventId,
    required this.artist,
  });
}

class Artist {
  final int artistId;
  final String artistName;
  final String description;
  final String createdAt;
  final String updatedAt;

  Artist({
    required this.artistId,
    required this.artistName,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });
}

class WorkerEvent {
  final int workerEventId;
  final int cost;
  final String createdAt;
  final String updatedAt;
  final int? workerId;
  final int eventId;
  final Worker? worker;

  WorkerEvent({
    required this.workerEventId,
    required this.cost,
    required this.createdAt,
    required this.updatedAt,
    required this.workerId,
    required this.eventId,
    this.worker,
  });
}

class Worker {
  final int workerId;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String password;
  final String image;
  final String createdAt;
  final String updatedAt;

  Worker({
    required this.workerId,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });
}

class Reservation {
  final int? reservationId;
  final bool? attendance;
  final int? numberOfPlaces;
  final int? attendanceNumber;
  final int? sectionNumber;
  final String? customerName;
  final String? createdAt;
  final String? updatedAt;
  final int? eventId;
  final int? customerId;
  final int? workerId;
  final Worker? worker;
  final List<Order>? orders;

  Reservation({
     this.reservationId,
     this.attendance,
     this.numberOfPlaces,
     this.attendanceNumber,
     this.sectionNumber,
     this.customerName,
     this.createdAt,
     this.updatedAt,
     this.eventId,
     this.customerId,
     this.workerId,
     this.worker,
    required this.orders,
  });
}

class Order {
  final int orderId;
  final String orderDate;
  final String? description;
  final String createdAt;
  final String updatedAt;
  final int? workerEventId;
  final int reservationId;
  final List<OrderDrink> orderDrinks;

  Order({
    required this.orderId,
    required this.orderDate,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.workerEventId,
    required this.reservationId,
    required this.orderDrinks,
  });
}

class OrderDrink {
  final int orderDrinkId;
  final int quantity;
  final String createdAt;
  final String updatedAt;
  final int orderId;
  final int drinkId;
  final Drink drink;

  OrderDrink({
    required this.orderDrinkId,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
    required this.orderId,
    required this.drinkId,
    required this.drink,
  });
}

class Drink {
  final int drinkId;
  final String title;
  final String description;
  final int price;
  final int quantity;
  final int cost;
  final String picture;
  final String createdAt;
  final String updatedAt;

  Drink({
    required this.drinkId,
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
    required this.cost,
    required this.picture,
    required this.createdAt,
    required this.updatedAt,
  });
}

class EventData {
  final Event event;
  final List<Reservation> reservations;
  final int bookingIncome;
  final int ordersIncome;

  EventData({
    required this.event,
    required this.reservations,
    required this.bookingIncome,
    required this.ordersIncome,
  });
}

class EventInfoModel {
  final bool status;
  final String message;
  final EventData data;

  EventInfoModel({
    required this.status,
    required this.message,
    required this.data,
  });
}

class EventInfoModel2 {
  EventInfoModel parseApiResponse(Map<String, dynamic> json) {
    return EventInfoModel(
      status: json['status'],
      message: json['message'],
      data: parseEventData(json['data']),
    );
  }

  EventData parseEventData(Map<String, dynamic> json) {
    return EventData(
      event: parseEvent(json['event']),
      reservations: parseReservations(json['reservations']),
      bookingIncome: json['bookingIncome'],
      ordersIncome: json['ordersIncome'],
    );
  }

  Event parseEvent(Map<String, dynamic> json) {
    return Event(
      eventId: json['event_id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      ticketPrice: json['ticket_price'] ?? 0,
      availablePlaces: json['available_places'] ?? 0,
      bandName: json['band_name'] ?? '',
      beginDate: json['begin_date'] ?? '',
      artistsCost: json['artists_cost'] ?? 0,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? "",
      adminId: json['admin_id'] ?? 0,
      photos: parsePhotos(json['photos']),
      artistEvents: parseArtistEvents(json['artist_events']),
      workerEvents: parseWorkerEvents(json['worker_events']),
    );
  }

  List<Photo> parsePhotos(List<dynamic> photos) {
    return photos
        .map((photoJson) => Photo(
              photoId: photoJson['photo_id'],
              picture: photoJson['picture'],
              createdAt: photoJson['createdAt'],
              updatedAt: photoJson['updatedAt'],
              eventId: photoJson['event_id'],
            ))
        .toList();
  }

  List<ArtistEvent> parseArtistEvents(List<dynamic> artistEvents) {
    return artistEvents
        .map((artistEventJson) => ArtistEvent(
              artistEventId: artistEventJson['artist_event_id'],
              createdAt: artistEventJson['createdAt'],
              updatedAt: artistEventJson['updatedAt'],
              artistId: artistEventJson['artist_id'],
              eventId: artistEventJson['event_id'],
              artist: parseArtist(artistEventJson['artist']),
            ))
        .toList();
  }

  Artist parseArtist(Map<String, dynamic> artistJson) {
    return Artist(
      artistId: artistJson['artist_id'],
      artistName: artistJson['artist_name'],
      description: artistJson['description'],
      createdAt: artistJson['createdAt'],
      updatedAt: artistJson['updatedAt'],
    );
  }

  List<WorkerEvent> parseWorkerEvents(List<dynamic> workerEvents) {
    return workerEvents
        .map((workerEventJson) => WorkerEvent(
              workerEventId: workerEventJson['worker_event_id'] ?? 0,
              cost: workerEventJson['cost'] ?? 0,
              createdAt: workerEventJson['createdAt'] ?? '',
              updatedAt: workerEventJson['updatedAt'] ?? '',
              workerId: workerEventJson['worker_id'] ?? 0,
              eventId: workerEventJson['event_id'] ?? 0,
              worker: workerEventJson['worker'] != null
                  ? parseWorker(workerEventJson['worker'])
                  : null,
            ))
        .toList();
  }

  Worker parseWorker(Map<String, dynamic> workerJson) {
    return Worker(
      workerId: workerJson['worker_id'],
      firstName: workerJson['first_name'],
      lastName: workerJson['last_name'],
      phoneNumber: workerJson['phone_number'],
      email: workerJson['email'],
      password: workerJson['password'],
      image: workerJson['image'],
      createdAt: workerJson['createdAt'],
      updatedAt: workerJson['updatedAt'],
    );
  }

  List<Reservation> parseReservations(List<dynamic> reservations) {
    return reservations
        .map((reservationJson) => Reservation(
              reservationId: reservationJson['reservation_id'],
              attendance: reservationJson['attendance'],
              numberOfPlaces: reservationJson['number_of_places'],
              attendanceNumber: reservationJson['attendance_number'],
              sectionNumber: reservationJson['section_number'],
              customerName: reservationJson['customer_name'],
              createdAt: reservationJson['createdAt'],
              updatedAt: reservationJson['updatedAt'],
              eventId: reservationJson['event_id'],
              customerId: reservationJson['customer_id'],
              workerId: reservationJson['worker_id'],
              worker: reservationJson['worker'] != null
                  ? parseWorker(reservationJson['worker'])
                  : null,
              orders: parseOrders(reservationJson['orders']),
            ))
        .toList();
  }

  List<Order> parseOrders(List<dynamic> orders) {
    return orders
        .map((orderJson) => Order(
              orderId: orderJson['order_id'],
              orderDate: orderJson['order_date'],
              description: orderJson['description'],
              createdAt: orderJson['createdAt'],
              updatedAt: orderJson['updatedAt'],
              workerEventId: orderJson['worker_event_id'],
              reservationId: orderJson['reservation_id'],
              orderDrinks: parseOrderDrinks(orderJson['order_drinks']),
            ))
        .toList();
  }

  List<OrderDrink> parseOrderDrinks(List<dynamic> orderDrinks) {
    return orderDrinks
        .map((orderDrinkJson) => OrderDrink(
              orderDrinkId: orderDrinkJson['order_drink_id'],
              quantity: orderDrinkJson['quantity'],
              createdAt: orderDrinkJson['createdAt'],
              updatedAt: orderDrinkJson['updatedAt'],
              orderId: orderDrinkJson['order_id'],
              drinkId: orderDrinkJson['drink_id'],
              drink: parseDrink(orderDrinkJson['drink']),
            ))
        .toList();
  }

  Drink parseDrink(Map<String, dynamic> drinkJson) {
    return Drink(
      drinkId: drinkJson['drink_id'],
      title: drinkJson['title'],
      description: drinkJson['description'],
      price: drinkJson['price'],
      quantity: drinkJson['quantity'],
      cost: drinkJson['cost'],
      picture: drinkJson['picture'],
      createdAt: drinkJson['createdAt'],
      updatedAt: drinkJson['updatedAt'],
    );
  }
}
