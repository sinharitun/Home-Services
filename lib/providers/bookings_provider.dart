// providers/bookings_provider.dart

import 'package:flutter/material.dart';
import '../models/booking.dart';

class BookingsProvider with ChangeNotifier {
  List<Booking> _bookings = [
    // Existing bookings
  ];

  // Getter to return bookings that are not cancelled
  List<Booking> get bookings => _bookings.where((booking) => booking.status != 'Cancelled').toList();

  // Method to add a new booking
  void addBooking(Booking booking) {
    _bookings.add(booking);
    notifyListeners();
  }

  // Method to cancel a booking by updating its status to 'Cancelled'
  void cancelBooking(String id) {
    _bookings = _bookings.map((booking) {
      if (booking.id == id) {
        return Booking(
          id: booking.id,
          serviceName: booking.serviceName,
          date: booking.date,
          time: booking.time,
          location: booking.location,
          status: 'Cancelled',
          notes: booking.notes,
        );
      }
      return booking;
    }).toList();
    notifyListeners();
  }
}
