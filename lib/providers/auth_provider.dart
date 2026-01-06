import 'package:flutter/foundation.dart';
import '../models/user_model.dart';
import 'dart:core';

class AuthProvider with ChangeNotifier {
  User? _currentUser;
  bool _isAuthenticated = false;

  User? get currentUser => _currentUser;
  bool get isAuthenticated => _isAuthenticated;

  void login(String username, String password) {
    // Simulate login - in real app, this would call an API
    _currentUser = User(
      id: '518502',
      username: username,
      name: username.toUpperCase(),
      phone: '97******64',
      profileImageUrl: 'https://i.pravatar.cc/150?img=${username.length}',
      balance: 30.0,
      totalRecharge: 30.0,
      totalWithdrawal: 0.0,
      productRevenue: 0.0,
      myOrders: 0,
      vipLevel: 0,
      vipProgress: 0.0,
      vipTarget: 330.0,
      hasBankCard: false,
    );
    _isAuthenticated = true;
    notifyListeners();
  }

  void signup(String username, String email, String password) {
    // Simulate signup - in real app, this would call an API
    _currentUser = User(
      id: '${DateTime.now().millisecondsSinceEpoch}',
      username: username,
      name: username.toUpperCase(),
      phone: '97******64',
      profileImageUrl: 'https://i.pravatar.cc/150?img=${username.length}',
      balance: 0.0,
      totalRecharge: 0.0,
      totalWithdrawal: 0.0,
      productRevenue: 0.0,
      myOrders: 0,
      vipLevel: 0,
      vipProgress: 0.0,
      vipTarget: 330.0,
      hasBankCard: false,
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
