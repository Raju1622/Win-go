class User {
  final String id;
  final String username;
  final String name;
  final String phone;
  final String profileImageUrl;
  final double balance;
  final double totalRecharge;
  final double totalWithdrawal;
  final double productRevenue;
  final int myOrders;
  final int vipLevel;
  final double vipProgress;
  final double vipTarget;
  final bool hasBankCard;

  User({
    required this.id,
    required this.username,
    required this.name,
    required this.phone,
    required this.profileImageUrl,
    required this.balance,
    required this.totalRecharge,
    required this.totalWithdrawal,
    required this.productRevenue,
    required this.myOrders,
    required this.vipLevel,
    required this.vipProgress,
    required this.vipTarget,
    this.hasBankCard = false,
  });
}
