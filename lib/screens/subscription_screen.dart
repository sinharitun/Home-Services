import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/service.dart';
import '../providers/services_provider.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final servicesProvider = Provider.of<ServicesProvider>(context);
    final services = servicesProvider.services;

    return Scaffold(
      appBar: AppBar(title: const Text('Subscriptions')),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (ctx, i) => SubscriptionCard(service: services[i]),
      ),
    );
  }
}

class SubscriptionCard extends StatelessWidget {
  final Service service;

  const SubscriptionCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: Text('${service.name} Subscription'),
        subtitle: Text('Get regular ${service.name.toLowerCase()} services at a discounted rate.'),
        trailing: SubscriptionButton(service: service),
      ),
    );
  }
}

class SubscriptionButton extends StatelessWidget {
  final Service service;

  const SubscriptionButton({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle subscription logic here
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Subscribed!'),

            content: Text('You have successfully subscribed to ${service.name} services.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
      child: const Text('Subscribe'),
    );
  }
}
