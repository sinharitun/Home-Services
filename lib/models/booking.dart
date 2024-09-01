// models/booking.dart

class Booking {
  final String id;
  final String serviceName;
  final String location;
  final String date;
  final String time;
  final String status;
  final String notes;

  Booking({
    required this.id,
    required this.serviceName,
    required this.location,
    required this.date,
    required this.time,
    required this.status,
    required this.notes,
  });

  Booking copyWith({
    String? id,
    String? serviceName,
    String? date,
    String? time,
    String? status,
    String? notes,
  }) {
    return Booking(
      id: id ?? this.id,
      serviceName: serviceName ?? this.serviceName,
      location: location,
      date: date ?? this.date,
      time: time ?? this.time,
      status: status ?? this.status,
      notes: notes ?? this.notes,
    );
  }
}
