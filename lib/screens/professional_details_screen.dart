import 'package:flutter/material.dart';
import '../models/professional.dart';

class ProfessionalDetailsScreen extends StatelessWidget {
  final Professional professional;

  const ProfessionalDetailsScreen({super.key, required this.professional});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(professional.name),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Person Icon
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: const Center(
                child: Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              professional.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Specialty: ${professional.specialty}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Rating: ${professional.rating.toStringAsFixed(1)}',
              style: const TextStyle(fontSize: 18, color: Colors.orange),
            ),
            const SizedBox(height: 16),
            // Additional Details
            const Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              professional.description, // Use the description field
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Contact Information:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Phone: (+91) 46458-31940', // Replace with actual contact info
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'Email: domain@homeservices.com', // Replace with actual email
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle contact action here (e.g., open dialer or email client)
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Contact ${professional.name}'),
                    content: const Text('Phone: (+91) 46458-31940\nEmail: domain@homeservices.com'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Contact ${professional.name}'),
            ),
          ],
        ),
      ),
    );
  }
}
