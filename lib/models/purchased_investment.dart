class PurchasedInvestment {
  final String id;
  final String planId;
  final String planName;
  final String planType;
  final double purchasePrice;
  final DateTime purchaseDate;
  final int revenueDays;
  final double dailyEarnings;
  final double totalRevenue;
  final int remainingDays;
  final bool isActive;

  PurchasedInvestment({
    required this.id,
    required this.planId,
    required this.planName,
    required this.planType,
    required this.purchasePrice,
    required this.purchaseDate,
    required this.revenueDays,
    required this.dailyEarnings,
    required this.totalRevenue,
    required this.remainingDays,
    this.isActive = true,
  });

  double get totalEarned {
    final daysPassed = DateTime.now().difference(purchaseDate).inDays;
    final earningDays = daysPassed < revenueDays ? daysPassed : revenueDays;
    return dailyEarnings * earningDays;
  }
}
