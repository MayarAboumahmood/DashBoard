class WorkerInformationModel {
  String firstName;
  String lastName;
  String numberPhone;
  String email;
  String? image;
  int? id;
  List<EventModelForWorkerDetailes>? events;
  WorkerInformationModel(
      {this.events,
      this.image,
      this.id,
      required this.email,
      required this.lastName,
      required this.firstName,
      required this.numberPhone});
  factory WorkerInformationModel.fromMap(Map<String, dynamic> map) {
    final eventJson = map['events'] as List<dynamic>;
    final finalEventJson = eventJson
        .map((drinkJson) => EventModelForWorkerDetailes.fromMap(drinkJson))
        .toList();

    print(finalEventJson);
    return WorkerInformationModel(
        firstName: map['worker']['first_name'] ?? '',
        lastName: map['worker']['last_name'] ?? '',
        numberPhone: map['worker']['phone_number'] ?? '',
        email: map['worker']['email'] ?? '',
        id: map['worker']['worker_id'] ?? 0,
        events: finalEventJson,
        image: map['worker']['image'] ?? '');
  }
}

class EventModelForWorkerDetailes {
  String title;
  String description;
  int ticketPrice;
  int availablePlaces;
  String bandName;
  String beginDate;
  int? adminId;
  String image;
  int id;
  List<AllActionsModelForWorker> actionsForEvent;
  EventModelForWorkerDetailes(
      {required this.title,
      required this.availablePlaces,
      required this.beginDate,
      required this.description,
      required this.ticketPrice,
      required this.image,
      this.adminId,
      required this.bandName,
      required this.id,
      required this.actionsForEvent});
  factory EventModelForWorkerDetailes.fromMap(Map<String, dynamic> map) {
    final eventsJson = map['actions'] as List<dynamic>;
    final eventDetailesList = eventsJson
        .map((drinkJson) => AllActionsModelForWorker.fromJson(drinkJson))
        .toList();

    return EventModelForWorkerDetailes(
        title: map['title'] ?? '',
        availablePlaces: map['available_places'] ?? '',
        beginDate: map['begin_date'] ?? '',
        description: map['description'] ?? '',
        ticketPrice: map['ticket_price'] ?? 0,
        bandName: map['band_name'] ?? '',
        id: map['event_id'] ?? 0,
        image: map['image'] ?? '',
        actionsForEvent: eventDetailesList);
  }
}

class AllActionsModelForWorker {
  final String action;
  final String time;
  final String details;

  AllActionsModelForWorker({
    required this.action,
    required this.time,
    required this.details,
  });

  factory AllActionsModelForWorker.fromJson(Map<String, dynamic> json) {
    String getDetailes() {
      if (json['action'] == 'confirm arrival') {
        return ReservationForWorkerDetailes().fromJson(json['details']);
      }
      // else if (json['action'] == 'Approving Order') {
      //   return DrinkModel().fromMap(json['details']);
      // }
      // else if (json['action'] == 'Deleting drink') {
      //   return DrinkModel().fromMap(json['details']);
      // }
      // else if (json['action'] == 'Creating Worker') {
      //   return WorkerDetails().fromJson(json['details']);
      // }
      // else if (json['action'] == 'Updating drink') {
      //   return "Old drink :\n${DrinkModelForUpdate().fromMap(json['details']['old_drink'])}\nDrink after edit :\n${DrinkModelForUpdate().fromMap(json['details']['new_drink'])}";
      // }
      return '';
    }

    return AllActionsModelForWorker(
      action: json['action'],
      time: json['time'],
      details: getDetailes(),
    );
  }
}

class ReservationForWorkerDetailes {
  final int? reservationId;
  final bool? attendance;
  final int? numberOfPlaces;
  final int? attendanceNumber;
  final int? sectionNumber;
  final String? customerName;
  final int? customerId;
  ReservationForWorkerDetailes({
    this.reservationId,
    this.attendance,
    this.numberOfPlaces,
    this.attendanceNumber,
    this.sectionNumber,
    this.customerName,
    this.customerId,
  });
  String fromJson(Map<String, dynamic> map) {
    ReservationForWorkerDetailes model = ReservationForWorkerDetailes(
        numberOfPlaces: map['number_of_places'] ?? 0,
        customerName: map['customer_name'] ?? 'UnKnown',
        attendance: map['attendance'] ?? false,
        attendanceNumber: map['attendance_number'] ?? 0,
        customerId: map['customer_id'] ?? 0,
        reservationId: map['reservation_id'] ?? 0,
        sectionNumber: map['section_number'] ?? 0);
    String data =
        'Reservation name${model.customerName}\nAttendance number${model.attendanceNumber}\nNumber of places${model.numberOfPlaces}';
    return data;
  }
}
