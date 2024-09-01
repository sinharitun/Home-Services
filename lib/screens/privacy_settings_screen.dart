import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/privacy_settings_provider.dart';

class PrivacySettingsScreen extends StatelessWidget {
  const PrivacySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final privacyProvider = Provider.of<PrivacySettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Settings'),
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
              'Profile Privacy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: const Text('Private Profile'),
              subtitle: const Text('Only you can see your profile details.'),
              value: privacyProvider.privateProfile,
              onChanged: (bool value) {
                privacyProvider.setPrivateProfile(value);
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Data Sharing',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: const Text('Share Data with Partners'),
              subtitle: const Text('Allow sharing your data with our partners for better service.'),
              value: privacyProvider.dataSharing,
              onChanged: (bool value) {
                privacyProvider.setDataSharing(value);
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Location Tracking',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: const Text('Enable Location Tracking'),
              subtitle: const Text('Allow the app to track your location for better service recommendations.'),
              value: privacyProvider.locationTracking,
              onChanged: (bool value) {
                privacyProvider.setLocationTracking(value);
              },
            ),
            const SizedBox(height: 32),
            const Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your privacy is important to us. We use your data to enhance your experience and provide better services. For more information, please review our Privacy Policy.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Privacy settings updated')),
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
