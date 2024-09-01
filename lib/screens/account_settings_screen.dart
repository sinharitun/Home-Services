import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/account_settings_provider.dart';
import '../providers/user_provider.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<AccountSettingsProvider>(context);
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
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
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Personal Information'),
            subtitle: Text(
                accountProvider.name.isNotEmpty
                    ? 'Name: ${accountProvider.name}\nEmail: ${accountProvider.email}'
                    : 'Name: Enter your Name\nEmail: ${accountProvider.email}'
            ),
            onTap: () {
              _showPersonalInfoDialog(context, accountProvider);
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('Phone Number'),
            subtitle: Text(
                accountProvider.phoneNumber.isNotEmpty
                    ? 'Phone: ${accountProvider.phoneNumber}'
                    : 'Phone: Enter your Phone number'
            ),
            onTap: () {
              _showPhoneNumberDialog(context, accountProvider);
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Change Password'),
            subtitle: const Text('Change your account password'),
            onTap: () {
              Navigator.pushNamed(context, '/changePassword');
            },
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Email Preferences'),
            subtitle: Text('Email notifications: ${accountProvider.emailPreferences ? "Enabled" : "Disabled"}'),
            onTap: () {
              Navigator.pushNamed(context, '/emailPreferences');
            },
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Security Settings'),
            subtitle: Text('Two-factor authentication: ${accountProvider.twoFactorAuth ? "Enabled" : "Disabled"}'),
            onTap: () {
              Navigator.pushNamed(context, '/securitySettings');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            subtitle: const Text('Sign out of your account'),
            onTap: () {
              // Perform logout logic
              userProvider.logout();
              accountProvider.logout();

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logging out...')),
              );

              // Navigate to login page
              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            },
          ),
        ],
      ),
    );
  }

  void _showPersonalInfoDialog(BuildContext context, AccountSettingsProvider provider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final nameController = TextEditingController(text: provider.name);
        final emailController = TextEditingController(text: provider.email);

        return AlertDialog(
          title: const Text('Update Personal Information'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter your Name',
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Enter your Email',
                  labelText: 'Email',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                final name = nameController.text.trim();
                final email = emailController.text.trim();

                if (name.isNotEmpty && email.isNotEmpty) {
                  provider.updateName(name);
                  provider.updateEmail(email);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Personal information updated')),
                  );
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill out all fields')),
                  );
                }
              },
              child: const Text('Save Changes'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showPhoneNumberDialog(BuildContext context, AccountSettingsProvider provider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final phoneNumberController = TextEditingController(text: provider.phoneNumber);

        return AlertDialog(
          title: const Text('Update Phone Number'),
          content: TextField(
            controller: phoneNumberController,
            decoration: const InputDecoration(
              hintText: 'Enter your Phone number',
              labelText: 'Phone Number',
            ),
            keyboardType: TextInputType.phone,
          ),
          actions: [
            TextButton(
              onPressed: () {
                final phoneNumber = phoneNumberController.text.trim();

                if (phoneNumber.isNotEmpty) {
                  provider.updatePhoneNumber(phoneNumber);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Phone number updated')),
                  );
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill out the field')),
                  );
                }
              },
              child: const Text('Save Changes'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
