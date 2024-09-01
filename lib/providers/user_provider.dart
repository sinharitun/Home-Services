import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  String _userEmail = '';
  String _userPassword = '';

  String get userEmail => _userEmail;
  String get userPassword => _userPassword;

  void setUser(String email, String password) {
    _userEmail = email;
    _userPassword = password;
    notifyListeners();
  }

  void logout() {
    _userEmail = '';
    _userPassword = '';
    notifyListeners();
  }
}
