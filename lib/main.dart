import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/user_provider.dart';
import 'providers/account_settings_provider.dart';
import 'providers/bookings_provider.dart';
import 'providers/privacy_settings_provider.dart';
import 'providers/notification_settings_provider.dart';
import 'providers/services_provider.dart';
import 'providers/professionals_provider.dart';
import 'screens/home_screen.dart';
import 'screens/booking_screen.dart';
import 'screens/bookings_screen.dart';
import 'screens/subscription_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/account_settings_screen.dart';
import 'screens/notification_settings_screen.dart';
import 'screens/privacy_settings_screen.dart';
import 'screens/help_support_screen.dart';
import 'screens/about_screen.dart';
import 'screens/feedback_screen.dart';
import 'screens/booking_details_screen.dart';
import 'screens/update_personal_info_screen.dart';
import 'screens/update_phone_number_screen.dart';
import 'screens/change_password_screen.dart';
import 'screens/email_preferences_screen.dart';
import 'screens/security_settings_screen.dart';
import 'screens/faq_screen.dart';
import 'screens/contact_us_screen.dart';
import 'screens/report_problem_screen.dart';
import 'screens/privacy_policy_screen.dart';
import 'screens/terms_of_service_screen.dart';
import 'screens/professional_list_screen.dart';
import 'screens/login_screen.dart';
import 'models/service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => AccountSettingsProvider()),
        ChangeNotifierProvider(create: (_) => ServicesProvider()),
        ChangeNotifierProvider(create: (_) => ProfessionalsProvider()),
        ChangeNotifierProvider(create: (_) => BookingsProvider()),
        ChangeNotifierProvider(create: (_) => NotificationSettingsProvider()),
        ChangeNotifierProvider(create: (_) => PrivacySettingsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key,});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'On-Demand Home Services',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AuthChecker(), // Using AuthChecker to decide initial screen
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/bookings': (context) => const BookingsScreen(),
        '/subscriptions': (context) => const SubscriptionScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/professionals': (context) => const ProfessionalListScreen(),
        '/accountSettings': (context) => const AccountSettingsScreen(),
        '/updatePersonalInfo': (context) => const UpdatePersonalInfoScreen(),
        '/notificationSettings': (context) => const NotificationSettingsScreen(),
        '/privacySettings': (context) => const PrivacySettingsScreen(),
        '/helpSupport': (context) => const HelpSupportScreen(),
        '/about': (context) => const AboutScreen(),
        '/feedback': (context) => const FeedbackScreen(),
        '/bookingDetails': (context) => const BookingDetailsScreen(),
        '/updatePhoneNumber': (context) => UpdatePhoneNumberScreen(),
        '/changePassword': (context) => const ChangePasswordScreen(),
        '/emailPreferences': (context) => const EmailPreferencesScreen(),
        '/securitySettings': (context) => const SecuritySettingsScreen(),
        '/faq': (context) =>  FAQScreen(),
        '/contactUs': (context) => const ContactUsScreen(),
        '/reportProblem': (context) => const ReportProblemScreen(),
        '/privacyPolicy': (context) => const PrivacyPolicyScreen(),
        '/termsOfService': (context) => const TermsOfServiceScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/booking') {
          final service = settings.arguments as Service?;
          if (service != null) {
            return MaterialPageRoute(
              builder: (context) => BookingScreen(service: service),
            );
          }
        }
        return null;
      },
    );
  }
}

class AuthChecker extends StatelessWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return userProvider.userEmail.isNotEmpty && userProvider.userPassword.isNotEmpty
        ? const HomeScreen()
        : const LoginScreen();
  }
}
