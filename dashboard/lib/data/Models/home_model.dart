class DashboardData {
  final int upcomingEvents;
  final int pastEvents;
  final int workers;
  final int customers;
  final int drinks;
  final int admins;
  final int totalCost;
  final int proceeds;
  final int profit;

  DashboardData({
    required this.upcomingEvents,
    required this.pastEvents,
    required this.workers,
    required this.customers,
    required this.drinks,
    required this.admins,
    required this.totalCost,
    required this.proceeds,
    required this.profit,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) {
    return DashboardData(
      upcomingEvents: json['upcoming_events'],
      pastEvents: json['past_events'],
      workers: json['workers'],
      customers: json['customers'],
      drinks: json['drinks'],
      admins: json['admins'],
      totalCost: json['totalCost'],
      proceeds: json['proceeds'],
      profit: json['profit'],
    );
  }
}
