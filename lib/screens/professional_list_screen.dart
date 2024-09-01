import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/professionals_provider.dart';
//import '../models/professional.dart';
import 'professional_details_screen.dart'; // Import the details screen

class ProfessionalListScreen extends StatelessWidget {

  const ProfessionalListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final professionalsProvider = Provider.of<ProfessionalsProvider>(context);
    final professionals = professionalsProvider.professionals;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Professionals'),
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
        itemCount: professionals.length,
        itemBuilder: (ctx, i) {
          final professional = professionals[i];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(professional.name),
              subtitle: Text('${professional.specialty}\nRating: ${professional.rating}'),
              isThreeLine: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfessionalDetailsScreen(professional: professional),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
