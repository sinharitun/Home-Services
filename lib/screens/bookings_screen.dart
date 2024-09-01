import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bookings_provider.dart';
//import '../models/booking.dart';

class BookingsScreen extends StatefulWidget {

  const BookingsScreen({super.key});
  @override
  //_BookingsScreenState createState() => _BookingsScreenState();
  State<BookingsScreen> createState() {
    return _BookingsScreenState();
  }
}

class _BookingsScreenState extends State<BookingsScreen> {
  int _selectedIndex = 1; // Default index for the 'Bookings' tab

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/', // Use the route name for your home screen
              (Route<dynamic> route) => false, // Clear navigation stack
        );
        break;
      case 1:
      // Stay on the current screen (Bookings)
        break;
      case 2:
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/settings',
              (Route<dynamic> route) => false, // Clear navigation stack
        );
        break;
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bookingsProvider = Provider.of<BookingsProvider>(context);
    final bookings = bookingsProvider.bookings;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bookings'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (ctx, i) {
          final booking = bookings[i];

          // Determine if the booking is confirmed
          String status = (booking.date.isNotEmpty && booking.time.isNotEmpty)
              ? 'Confirmed'
              : 'Pending';

          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.book_online),
              title: Text(booking.serviceName),
              subtitle: Text(
                'Date: ${booking.date}\n'
                    'Time: ${booking.time}\n'
                    'Location: ${booking.location.isNotEmpty ? booking.location : 'Not specified'}\n' // Ensure location is displayed correctly
                    'Status: $status',
              ),
              isThreeLine: true,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/bookingDetails',
                  arguments: booking,
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.blueAccent, width: 2.0),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Bookings'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          ],
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}
