import '../models/investment_model.dart';

class InvestmentService {
  static List<InvestmentPlan> getFixedFundPlans() {
    return [
      InvestmentPlan(
        id: '1',
        name: 'VIP1',
        type: 'Fixed Fund',
        price: 330.00,
        revenueDays: 48,
        dailyEarnings: 267.3,
        totalRevenue: 12830.4,
        imageUrl: 'https://picsum.photos/400/300?random=10',
      ),
      InvestmentPlan(
        id: '2',
        name: 'VIP2',
        type: 'Fixed Fund',
        price: 2730.00,
        revenueDays: 48,
        dailyEarnings: 2238.6,
        totalRevenue: 107452.8,
        imageUrl: 'https://picsum.photos/400/300?random=11',
      ),
      InvestmentPlan(
        id: '3',
        name: 'VIP3',
        type: 'Fixed Fund',
        price: 8300.00,
        revenueDays: 48,
        dailyEarnings: 6806.0,
        totalRevenue: 326688.0,
        imageUrl: 'https://picsum.photos/400/300?random=12',
      ),
    ];
  }

  static List<InvestmentPlan> getWelfareFundPlans() {
    return [
      InvestmentPlan(
        id: '4',
        name: 'VIP1',
        type: 'Welfare Fund',
        price: 500.00,
        revenueDays: 60,
        dailyEarnings: 350.0,
        totalRevenue: 21000.0,
        imageUrl: 'https://picsum.photos/400/300?random=13',
      ),
      InvestmentPlan(
        id: '5',
        name: 'VIP2',
        type: 'Welfare Fund',
        price: 5000.00,
        revenueDays: 60,
        dailyEarnings: 4000.0,
        totalRevenue: 240000.0,
        imageUrl: 'https://picsum.photos/400/300?random=14',
      ),
    ];
  }

  static List<InvestmentPlan> getActivityFundPlans() {
    return [
      InvestmentPlan(
        id: '6',
        name: 'VIP1',
        type: 'Activity Fund',
        price: 1000.00,
        revenueDays: 30,
        dailyEarnings: 500.0,
        totalRevenue: 15000.0,
        imageUrl: 'https://picsum.photos/400/300?random=15',
        isHot: true,
      ),
      InvestmentPlan(
        id: '7',
        name: 'VIP2',
        type: 'Activity Fund',
        price: 10000.00,
        revenueDays: 30,
        dailyEarnings: 6000.0,
        totalRevenue: 180000.0,
        imageUrl: 'https://picsum.photos/400/300?random=16',
        isHot: true,
      ),
    ];
  }
}
