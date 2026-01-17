import 'package:flutter/material.dart';
import '../../utils/currency_format.dart';

class BalanceCard extends StatelessWidget {
  final double balance;
  final double income;
  final double expense;

  const BalanceCard({
    super.key,
    required this.balance,
    required this.income,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: const Color(0xFF6200EE),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Saldo Total',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              CurrencyFormat.toBRL(balance),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIndicator(
                  context,
                  label: 'Receitas',
                  value: income,
                  icon: Icons.arrow_upward,
                  color: const Color(0xFF03DAC6),
                ),
                Container(width: 1, height: 40, color: Colors.white24),
                _buildIndicator(
                  context,
                  label: 'Despesas',
                  value: expense,
                  icon: Icons.arrow_downward,
                  color: const Color(0xFFCF6679),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator(BuildContext context,
      {required String label,
      required double value,
      required IconData icon,
      required Color color}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 16),
            const SizedBox(width: 4),
            Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          CurrencyFormat.toBRL(value),
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
