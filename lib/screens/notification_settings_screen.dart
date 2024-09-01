import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/notification_settings_provider.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<NotificationSettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
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
            const Text(
              'Notification Preferences',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Promotional Notifications'),
              subtitle: const Text('Receive notifications about special offers, promotions, and discounts.'),
              value: settingsProvider.promotionalNotifications,
              onChanged: (bool value) {
                settingsProvider.setPromotionalNotifications(value);
              },
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Service Updates'),
              subtitle: const Text('Get updates and information about the services you are using.'),
              value: settingsProvider.serviceUpdates,
              onChanged: (bool value) {
                settingsProvider.setServiceUpdates(value);
              },
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Reminders'),
              subtitle: const Text('Receive reminders for upcoming appointments, bookings, and deadlines.'),
              value: settingsProvider.reminders,
              onChanged: (bool value) {
                settingsProvider.setReminders(value);
              },
            ),
            const SizedBox(height: 32),
            const Text(
              'Notification Policy',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'We use notifications to keep you informed about important updates, offers, and reminders. You can manage your notification preferences at any time.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Notification settings updated')),
                );
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
