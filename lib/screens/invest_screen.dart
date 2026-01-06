import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/investment_model.dart';
import '../models/purchased_investment.dart';
import '../services/investment_service.dart';
import '../providers/auth_provider.dart';

class InvestScreen extends StatefulWidget {
  const InvestScreen({super.key});

  @override
  State<InvestScreen> createState() => _InvestScreenState();
}

class _InvestScreenState extends State<InvestScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32),
        title: const Text(
          'Indianges',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child:
                  const Icon(Icons.headset_mic, color: Colors.white, size: 20),
            ),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: [
            const Tab(text: 'Fixed Fund'),
            const Tab(text: 'Welfare Fund'),
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Activity Fund'),
                  const SizedBox(width: 4),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'HOT',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildPlanList(InvestmentService.getFixedFundPlans()),
          _buildPlanList(InvestmentService.getWelfareFundPlans()),
          _buildPlanList(InvestmentService.getActivityFundPlans()),
        ],
      ),
    );
  }

  Widget _buildPlanList(List<InvestmentPlan> plans) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: plans.length,
      itemBuilder: (context, index) {
        return _buildPlanCard(plans[index]);
      },
    );
  }

  Widget _buildPlanCard(InvestmentPlan plan) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) {
        final user = authProvider.currentUser;
        final isPurchased = authProvider.hasPurchasedInvestment(plan.id);
        final purchasedInvestment =
            authProvider.getPurchasedInvestment(plan.id);

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              // Banner
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: isPurchased
                      ? const Color(0xFF4CAF50)
                      : const Color(0xFF2E7D32),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          isPurchased
                              ? Icons.check_circle
                              : Icons.shopping_cart,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          isPurchased
                              ? 'Purchased ${plan.name}'
                              : 'Buy and upgrade ${plan.name}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    if (isPurchased && purchasedInvestment != null)
                      ElevatedButton(
                        onPressed: () => _showSellDialog(
                            context, plan, purchasedInvestment, authProvider),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFFE91E63),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Sell',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    else
                      ElevatedButton(
                        onPressed: user != null && user.balance >= plan.price
                            ? () => _showBuyDialog(context, plan, authProvider)
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF2E7D32),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Buy',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                  ],
                ),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    // Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        plan.imageUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey[300],
                            child: const Icon(Icons.image),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Each Price ₹${plan.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFF9800),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Revenue ${plan.revenueDays} Days',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF2E7D32),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Daily Earnings ₹${plan.dailyEarnings.toStringAsFixed(1)}',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Total Revenue ₹${plan.totalRevenue.toStringAsFixed(1)}',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[700],
                            ),
                          ),
                          if (isPurchased && purchasedInvestment != null) ...[
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color(0xFF4CAF50).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.trending_up,
                                      color: Color(0xFF4CAF50), size: 16),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Earned: ₹${purchasedInvestment.totalEarned.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF4CAF50),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showBuyDialog(
      BuildContext context, InvestmentPlan plan, AuthProvider authProvider) {
    final user = authProvider.currentUser;
    if (user == null) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Purchase'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Plan: ${plan.name}'),
            const SizedBox(height: 8),
            Text('Price: ₹${plan.price.toStringAsFixed(2)}'),
            const SizedBox(height: 8),
            Text('Your Balance: ₹${user.balance.toStringAsFixed(2)}'),
            const SizedBox(height: 8),
            if (user.balance < plan.price)
              const Text(
                'Insufficient balance!',
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              try {
                authProvider.buyInvestment(
                  planId: plan.id,
                  planName: plan.name,
                  planType: plan.type,
                  price: plan.price,
                  revenueDays: plan.revenueDays,
                  dailyEarnings: plan.dailyEarnings,
                  totalRevenue: plan.totalRevenue,
                );
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Investment purchased successfully!'),
                    backgroundColor: Colors.green,
                  ),
                );
              } catch (e) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(e.toString()),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2E7D32),
            ),
            child: const Text('Buy'),
          ),
        ],
      ),
    );
  }

  void _showSellDialog(BuildContext context, InvestmentPlan plan,
      PurchasedInvestment purchasedInvestment, AuthProvider authProvider) {
    final totalEarned = purchasedInvestment.totalEarned;
    final sellPrice = purchasedInvestment.purchasePrice + totalEarned;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Sell'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Plan: ${plan.name}'),
            const SizedBox(height: 8),
            Text(
                'Purchase Price: ₹${purchasedInvestment.purchasePrice.toStringAsFixed(2)}'),
            const SizedBox(height: 8),
            Text('Total Earned: ₹${totalEarned.toStringAsFixed(2)}'),
            const SizedBox(height: 8),
            Text(
              'Sell Price: ₹${sellPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4CAF50),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              authProvider.sellInvestment(plan.id);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'Sold successfully! You received ₹${sellPrice.toStringAsFixed(2)}'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE91E63),
            ),
            child: const Text('Sell'),
          ),
        ],
      ),
    );
  }
}
