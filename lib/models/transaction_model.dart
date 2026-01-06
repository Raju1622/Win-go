class Transaction {
  final String id;
  final String type; // 'recharge', 'withdrawal', 'earning'
  final double amount;
  final DateTime timestamp;
  final String status; // 'pending', 'completed', 'failed'

  Transaction({
    required this.id,
    required this.type,
    required this.amount,
    required this.timestamp,
    required this.status,
  });
}
