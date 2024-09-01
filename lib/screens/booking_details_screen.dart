import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/booking.dart';
import '../providers/bookings_provider.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final Booking booking = ModalRoute.of(context)!.settings.arguments as Booking;
    final bookingsProvider = Provider.of<BookingsProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Details'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/', // Home services page route name
                  (Route<dynamic> route) => false, // Remove all previous routes
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Service: ${booking.serviceName}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Location: ${booking.location}', // Handle null location
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'Date: ${booking.date}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'Time: ${booking.time}', // Added time
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'Status: ${booking.status}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: booking.status == 'Cancelled' ? null : () {
                bookingsProvider.cancelBooking(booking.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Booking cancelled for ${booking.serviceName}')),
                );
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/', // Home services page route name
                      (Route<dynamic> route) => false, // Remove all previous routes
                );
              },
              
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              child: const Text('Cancel Booking'),
            ),
          ],
        ),
      ),
    );
  }
}
