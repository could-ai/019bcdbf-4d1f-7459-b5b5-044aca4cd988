import 'package:flutter/material.dart';
import '../utils/currency_format.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data
    final transactions = [
      {'title': 'Supermercado', 'category': 'Alimentação', 'value': -450.00, 'date': 'Hoje'},
      {'title': 'Salário', 'category': 'Renda', 'value': 3500.00, 'date': 'Ontem'},
      {'title': 'Uber', 'category': 'Transporte', 'value': -24.90, 'date': 'Ontem'},
      {'title': 'Netflix', 'category': 'Lazer', 'value': -55.90, 'date': '15/05'},
      {'title': 'Aluguel', 'category': 'Moradia', 'value': -1200.00, 'date': '10/05'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            'Transações Recentes',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final tx = transactions[index];
            final value = tx['value'] as double;
            final isExpense = value < 0;

            return ListTile(
              leading: CircleAvatar(
                backgroundColor: isExpense ? Colors.red[50] : Colors.green[50],
                child: Icon(
                  isExpense ? Icons.shopping_bag_outlined : Icons.attach_money,
                  color: isExpense ? Colors.red : Colors.green,
                ),
              ),
              title: Text(tx['title'] as String, style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text(tx['category'] as String),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    CurrencyFormat.toBRL(value),
                    style: TextStyle(
                      color: isExpense ? Colors.red : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    tx['date'] as String,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
