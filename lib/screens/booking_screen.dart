import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import FontAwesome package
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // Import for date and time formatting
import '../models/service.dart';
import '../models/booking.dart';
import '../providers/bookings_provider.dart';

class BookingScreen extends StatefulWidget {
  final Service service;

  const BookingScreen({super.key, required this.service});

  @override
  //_BookingScreenState createState() => _BookingScreenState();
  State<BookingScreen> createState() {
    return _BookingScreenState();
    
  }
}

class _BookingScreenState extends State<BookingScreen> {
  final _locationController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _workController = TextEditingController(); // Added controller for new field
  bool _isLoading = false;

  @override
  void dispose() {
    _locationController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _workController.dispose(); // Dispose the new controller
    super.dispose();
  }

  bool _validateDate(String date) {
    try {
      DateFormat('dd-MM-yyyy').parseStrict(date);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool _validateTime(String time) {
    try {
      DateFormat('HH:mm').parseStrict(time);
      return true;
    } catch (e) {
      return false;
    }
  }

  void _confirmBooking() {
    final location = _locationController.text.trim();
    final date = _dateController.text.trim();
    final time = _timeController.text.trim();
    final work = _workController.text.trim(); // Get work from new field

    if (location.isEmpty || date.isEmpty || time.isEmpty || work.isEmpty) { // Check if work is provided
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields.')),
      );
      return;
    }

    if (!_validateDate(date)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid date in DD-MM-YYYY format.')),
      );
      return;
    }

    if (!_validateTime(time)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid time in HH:MM format.')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final newBooking = Booking(
      id: DateTime.now().toString(), // Unique ID for the booking
      serviceName: widget.service.name,
      date: date,
      time: time,
      status: 'Pending', // Initial status
      notes: work, // Use work from the new field
      location: location, // Use location from the controller
    );

    // Add the new booking to the provider
    Provider.of<BookingsProvider>(context, listen: false).addBooking(newBooking);

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Booking Confirmed for ${widget.service.name}')),
      );

      // Optionally navigate back to the previous screen
      Navigator.pop(context);
    });
  }

  void _cancelBooking() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final service = widget.service;

    IconData getServiceIcon() {
      switch (service.name.toLowerCase()) {
        case 'plumbing':
          return FontAwesomeIcons.piedPiper; // Example icon
        case 'cleaning':
          return FontAwesomeIcons.broom; // Example icon
        case 'electrical':
          return FontAwesomeIcons.elevator; // Example icon
        case 'painting':
          return FontAwesomeIcons.paintbrush; // Example icon
        case 'carpentry':
          return FontAwesomeIcons.hammer; // Example icon
        case 'gardening':
          return FontAwesomeIcons.leaf; // Example icon
        case 'hvac repair':
          return FontAwesomeIcons.snowflake; // Example icon
        case 'pest control':
          return FontAwesomeIcons.houseMedical; // Example icon
        case 'moving services':
          return FontAwesomeIcons.house; // Example icon
        case 'appliance repair':
          return FontAwesomeIcons.tv; // Example icon
        default:
          return FontAwesomeIcons.circleQuestion; // Default icon
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Book ${service.name}'),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Service Icon
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 15,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    getServiceIcon(),
                    size: 100,
                    color: Colors.blueAccent, // Custom color
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Service: ${service.name}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Description: ${service.description}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text(
                'Price: ₹${service.price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              // New field for work
              const Text('Select Work:'),
              TextField(
                controller: _workController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'What do you want to get done?',
                ),
              ),
              const SizedBox(height: 20),
              const Text('Select Location:'),
              TextField(
                controller: _locationController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your location',
                ),
              ),
              const SizedBox(height: 20),
              const Text('Select Date:'),
              TextField(
                controller: _dateController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter date (DD-MM-YYYY)',
                ),
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: 20),
              const Text('Select Time:'),
              TextField(
                controller: _timeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter time (HH:MM)',
                ),
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _isLoading ? null : _confirmBooking,
               
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Button color
                  overlayColor: Colors.white, // Text color
                ),
                 child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Confirm Booking'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _cancelBooking,
                
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent, // Button color
                  overlayColor: Colors.white, // Text color
                ),
                child: const Text('Cancel Booking'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
