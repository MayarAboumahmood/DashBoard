class AllActionsModel {
  final String action;
  final String time;
  final String details;

  AllActionsModel({
    required this.action,
    required this.time,
    required this.details,
  });

  factory AllActionsModel.fromJson(Map<String, dynamic> json) {
    String getDetailes() {
      if (json['action'] == 'Adding New Event') {
        return EventDetails().fromJson(json['details']);
      } else if (json['action'] == 'Adding drink') {
        return DrinkModel().fromMap(json['details']);
      } else if (json['action'] == 'Adding New Artist') {
        return AddArtistModel().fromMap(json['details']);
      } else if (json['action'] == 'Deleting drink') {
        return DrinkModel().fromMap(json['details']);
      } else if (json['action'] == 'Creating Worker') {
        return WorkerDetails().fromJson(json['details']);
      } else if (json['action'] == 'Updating drink') {
        return "Old drink :\n${DrinkModelForUpdate().fromMap(json['details']['old_drink'])}\nDrink after edit :\n${DrinkModelForUpdate().fromMap(json['details']['new_drink'])}";
      }
      return '';
    }

    return AllActionsModel(
      action: json['action'],
      time: json['time'],
      details: getDetailes(),
    );
  }
}

class AddArtistModel {
  final String? name;
  final String? description;
  final int? id;
  AddArtistModel({
    this.description,
    this.id,
    this.name,
  });

  String fromMap(Map<String, dynamic> map) {
    AddArtistModel eventDetails = AddArtistModel(
      name: map['artist_name'] ?? '',
      description: map['description'] ?? '',
      id: map['artist_id'] ?? 0,
    );
    String data =
        'Name : ${eventDetails.name}\nDescription:${eventDetails.description}';
    return data;
  }
}

class DrinkModel {
  final String? name;
  final int? price;
  final String? image;
  final String? description;
  final int? cost;
  final int? quantity;
  final int? id;
  DrinkModel(
      {this.cost,
      this.description,
      this.id,
      this.image,
      this.name,
      this.price,
      this.quantity});

  String fromMap(Map<String, dynamic> map) {
    DrinkModel eventDetails = DrinkModel(
        name: map['title'] ?? '',
        price: map['price'] ?? 0,
        cost: map['cost'] ?? 0,
        quantity: map['quantity'] ?? 0,
        description: map['description'] ?? '',
        id: map['drink_id'] ?? 0,
        image: map['picture'] ?? '');
    String data =
        'Name : ${eventDetails.name}\nPrice :${eventDetails.price}\nCost :${eventDetails.cost}\nQuantity:${eventDetails.quantity}\nDescription:${eventDetails.description}';
    return data;
  }
}

class DrinkModelForUpdate {
  final String? name;
  final String? price;
  final String? image;
  final String? description;
  final String? cost;
  final String? quantity;
  final int? id;
  DrinkModelForUpdate(
      {this.cost,
      this.description,
      this.id,
      this.image,
      this.name,
      this.price,
      this.quantity});

  String fromMap(Map<String, dynamic> map) {
    DrinkModelForUpdate eventDetails = DrinkModelForUpdate(
        name: map['title'] ?? '',
        price: map['price'] ?? '',
        cost: map['cost'] ?? '',
        quantity: map['quantity'] ?? '',
        description: map['description'] ?? '',
        id: map['drink_id'] ?? 0,
        image: map['picture'] ?? '');
    String data =
        'Name : ${eventDetails.name}\nPrice :${eventDetails.price}\nCost :${eventDetails.cost}\nQuantity:${eventDetails.quantity}\nDescription:${eventDetails.description}';
    return data;
  }
}

class EventDetails {
  final int? eventId;
  final String? title;
  final String? description;
  final int? ticketPrice;
  final int? availablePlaces;
  final String? bandName;
  final DateTime? beginDate;
  final int? adminId;
  final int? artistsCost;
  final String? updatedAt;
  final String? createdAt;

  EventDetails({
    this.eventId,
    this.title,
    this.description,
    this.ticketPrice,
    this.availablePlaces,
    this.bandName,
    this.beginDate,
    this.adminId,
    this.artistsCost,
    this.updatedAt,
    this.createdAt,
  });

  String fromJson(Map<String, dynamic> json) {
    EventDetails eventDetails = EventDetails(
      eventId: json['event_id'],
      title: json['title'],
      description: json['description'],
      ticketPrice: json['ticket_price'],
      availablePlaces: json['available_places'],
      bandName: json['band_name'],
      beginDate: DateTime.parse(json['begin_date']),
      adminId: json['admin_id'],
      artistsCost: json['artists_cost'],
      updatedAt: json['updatedAt'],
      createdAt: json['createdAt'],
    );

    String data =
        'title : ${eventDetails.title}\ndescription :${eventDetails.description}\nticketPrice :${eventDetails.ticketPrice}\navailablePlaces :${eventDetails.availablePlaces}\nbeginDate: ${eventDetails.beginDate}\nartistsCost :${eventDetails.artistsCost}';
    print(data);
    return data;
  }
}

class WorkerDetails {
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? email;
  final String? image;

  WorkerDetails({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.image,
  });

  String fromJson(Map<String, dynamic> json) {
    WorkerDetails workerDetails = WorkerDetails(
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      image: json['image'],
    );
    String data =
        'firstName :${workerDetails.firstName}\nlastName :${workerDetails.lastName}\nphoneNumber :${workerDetails.phoneNumber}\nemail :${workerDetails.email}';
    print(data);
    return data;
  }
}
