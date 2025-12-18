import 'package:flutter/foundation.dart';
import '../models/user_model.dart';

class AuthProvider with ChangeNotifier {
  User? _currentUser;
  bool _isAuthenticated = false;

  User? get currentUser => _currentUser;
  bool get isAuthenticated => _isAuthenticated;

  void login(String username, String password) {
    // Simulate login - in real app, this would call an API
    _currentUser = User(
      id: '1',
      username: username,
      name: username,
      bio: 'This is my bio',
      profileImageUrl: 'https://i.pravatar.cc/150?img=$username.length',
      followers: 1200,
      following: 500,
      posts: 45,
    );
    _isAuthenticated = true;
    notifyListeners();
  }

  void signup(String username, String email, String password) {
    // Simulate signup - in real app, this would call an API
    _currentUser = User(
      id: '1',
      username: username,
      name: username,
      bio: 'Welcome to my profile',
      profileImageUrl: 'https://i.pravatar.cc/150?img=$username.length',
      followers: 0,
      following: 0,
      posts: 0,
    );
    _isAuthenticated = true;
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    _isAuthenticated = false;
    notifyListeners();
  }
}
