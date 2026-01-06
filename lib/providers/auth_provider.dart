import 'package:flutter/foundation.dart';
import '../models/user_model.dart';
import '../models/purchased_investment.dart';
import 'dart:core';

class AuthProvider with ChangeNotifier {
  User? _currentUser;
  bool _isAuthenticated = false;
  List<PurchasedInvestment> _purchasedInvestments = [];

  User? get currentUser => _currentUser;
  bool get isAuthenticated => _isAuthenticated;
  List<PurchasedInvestment> get purchasedInvestments => _purchasedInvestments;

  bool hasPurchasedInvestment(String planId) {
    return _purchasedInvestments
        .any((inv) => inv.planId == planId && inv.isActive);
  }

  PurchasedInvestment? getPurchasedInvestment(String planId) {
    try {
      return _purchasedInvestments.firstWhere(
        (inv) => inv.planId == planId && inv.isActive,
      );
    } catch (e) {
      return null;
    }
  }

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

  void buyInvestment({
    required String planId,
    required String planName,
    required String planType,
    required double price,
    required int revenueDays,
    required double dailyEarnings,
    required double totalRevenue,
  }) {
    if (_currentUser == null) return;

    if (_currentUser!.balance < price) {
      throw Exception('Insufficient balance');
    }

    final investment = PurchasedInvestment(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      planId: planId,
      planName: planName,
      planType: planType,
      purchasePrice: price,
      purchaseDate: DateTime.now(),
      revenueDays: revenueDays,
      dailyEarnings: dailyEarnings,
      totalRevenue: totalRevenue,
      remainingDays: revenueDays,
      isActive: true,
    );

    _purchasedInvestments.add(investment);

    _currentUser = User(
      id: _currentUser!.id,
      username: _currentUser!.username,
      name: _currentUser!.name,
      phone: _currentUser!.phone,
      profileImageUrl: _currentUser!.profileImageUrl,
      balance: _currentUser!.balance - price,
      totalRecharge: _currentUser!.totalRecharge,
      totalWithdrawal: _currentUser!.totalWithdrawal,
      productRevenue: _currentUser!.productRevenue + dailyEarnings,
      myOrders: _currentUser!.myOrders + 1,
      vipLevel: _currentUser!.vipLevel,
      vipProgress: _currentUser!.vipProgress + price,
      vipTarget: _currentUser!.vipTarget,
      hasBankCard: _currentUser!.hasBankCard,
    );

    notifyListeners();
  }

  void sellInvestment(String planId) {
    final investment = getPurchasedInvestment(planId);
    if (investment == null || _currentUser == null) return;

    final totalEarned = investment.totalEarned;
    final sellPrice = investment.purchasePrice + totalEarned;

    _purchasedInvestments = _purchasedInvestments.map((inv) {
      if (inv.id == investment.id) {
        return PurchasedInvestment(
          id: inv.id,
          planId: inv.planId,
          planName: inv.planName,
          planType: inv.planType,
          purchasePrice: inv.purchasePrice,
          purchaseDate: inv.purchaseDate,
          revenueDays: inv.revenueDays,
          dailyEarnings: inv.dailyEarnings,
          totalRevenue: inv.totalRevenue,
          remainingDays: inv.remainingDays,
          isActive: false,
        );
      }
      return inv;
    }).toList();

    _currentUser = User(
      id: _currentUser!.id,
      username: _currentUser!.username,
      name: _currentUser!.name,
      phone: _currentUser!.phone,
      profileImageUrl: _currentUser!.profileImageUrl,
      balance: _currentUser!.balance + sellPrice,
      totalRecharge: _currentUser!.totalRecharge,
      totalWithdrawal: _currentUser!.totalWithdrawal,
      productRevenue: _currentUser!.productRevenue,
      myOrders: _currentUser!.myOrders,
      vipLevel: _currentUser!.vipLevel,
      vipProgress: _currentUser!.vipProgress,
      vipTarget: _currentUser!.vipTarget,
      hasBankCard: _currentUser!.hasBankCard,
    );

    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    _isAuthenticated = false;
    _purchasedInvestments = [];
    notifyListeners();
  }
}
