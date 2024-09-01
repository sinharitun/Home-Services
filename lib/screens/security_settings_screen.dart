import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/account_settings_provider.dart';

class SecuritySettingsScreen extends StatefulWidget {
  const SecuritySettingsScreen({super.key});

  @override
  _SecuritySettingsScreenState createState() => _SecuritySettingsScreenState();
}

class _SecuritySettingsScreenState extends State<SecuritySettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AccountSettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Security Settings'),
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
            SwitchListTile(
              title: const Text('Enable Two-Factor Authentication'),
              value: provider.twoFactorAuth,
              onChanged: (bool value) {
                provider.updateTwoFactorAuth(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
