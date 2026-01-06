class InvestmentPlan {
  final String id;
  final String name;
  final String type; // 'Fixed Fund', 'Welfare Fund', 'Activity Fund'
  final double price;
  final int revenueDays;
  final double dailyEarnings;
  final double totalRevenue;
  final String imageUrl;
  final bool isHot;

  InvestmentPlan({
    required this.id,
    required this.name,
    required this.type,
    required this.price,
    required this.revenueDays,
    required this.dailyEarnings,
    required this.totalRevenue,
    required this.imageUrl,
    this.isHot = false,
  });
}
