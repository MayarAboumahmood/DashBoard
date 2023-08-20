class AllActionsModel {
  final String action;
  final String time;
  final String details;
  // final EventDetails? event;
  AllActionsModel({
    required this.action,
    required this.time,
    required this.details,
    // this.event
  });

  factory AllActionsModel.fromJson(Map<String, dynamic> json) {
    print(json['action']);
    return AllActionsModel(
      action: json['action'],
      // event: EventDetails().getEvent(json['details']),
      time: json['time'],
      details: json['action'] == 'Adding New Event'
          ? EventDetails().fromJson(json['details'])
          : WorkerDetails().fromJson(json['details']),
    );
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
  EventDetails getEvent(Map<String, dynamic> json) {
    return EventDetails(
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
  }

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
