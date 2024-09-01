import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bookings_provider.dart';
//import '../models/booking.dart';

class MyBookingsScreen extends StatelessWidget {

  const MyBookingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final bookings = Provider.of<BookingsProvider>(context).bookings;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bookings'),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/',
                  (Route<dynamic> route) => false, // Clear all routes
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          return ListTile(
            title: Text(booking.serviceName),
            subtitle: Text('Date: ${booking.date}\nStatus: ${booking.status}'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/bookingDetails',
                arguments: booking,
              );
            },
          );
        },
      ),
    );
  }
}
