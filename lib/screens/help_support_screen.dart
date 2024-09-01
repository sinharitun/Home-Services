import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
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
            leading: const Icon(Icons.question_answer),
            title: const Text('FAQ'),
            subtitle: const Text('Frequently Asked Questions'),
            onTap: () {
              Navigator.pushNamed(context, '/faq');
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_support),
            title: const Text('Contact Us'),
            subtitle: const Text('Reach out to our support team'),
            onTap: () {
              Navigator.pushNamed(context, '/contactUs');
            },
          ),
          ListTile(
            leading: const Icon(Icons.report_problem),
            title: const Text('Report a Problem'),
            subtitle: const Text('Report issues or bugs'),
            onTap: () {
              Navigator.pushNamed(context, '/reportProblem');
            },
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text('Feedback'),
            subtitle: const Text('Give us your feedback'),
            onTap: () {
              Navigator.pushNamed(context, '/feedback');
            },
          ),
          ListTile(
            leading: const Icon(Icons.shield),
            title: const Text('Privacy Policy'),
            subtitle: const Text('Read our privacy policy'),
            onTap: () {
              Navigator.pushNamed(context, '/privacyPolicy');
            },
          ),
          ListTile(
            leading: const Icon(Icons.gavel),
            title: const Text('Terms of Service'),
            subtitle: const Text('Read our terms of service'),
            onTap: () {
              Navigator.pushNamed(context, '/termsOfService');
            },
          ),
        ],
      ),
    );
  }
}
