import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/service.dart';

class ServiceCard extends StatelessWidget {
  final Service service;

  const ServiceCard({super.key, required this.service});

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
        return FontAwesomeIcons.questionCircle; // Default icon
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          '/booking',
          arguments: service,
        );
      },
      child: Hero(
        tag: 'service-${service.name}',
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(
                  getServiceIcon(),  // Use the dynamic icon here
                  size: 50,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        service.name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis, // Prevents overflow
                      ),
                      const SizedBox(height: 8),
                      Text(
                        service.description,
                        overflow: TextOverflow.ellipsis, // Prevents overflow
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
