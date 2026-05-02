
import 'package:flutter/material.dart';
import '../services/sales_service.dart';
import '../services/business_service.dart';
import '../services/calculation_service.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  double revenue = 0;
  double expenses = 0;
  double profit = 0;

  @override
  void initState() {
    super.initState();
    calculate();
  }

  void calculate() {

    revenue = SalesService.getTotalSales();

    var expensesList = BusinessService.getExpenses();
    expenses = 0;

    for (var e in expensesList) {
      expenses += (e['amount'] ?? 0).toDouble();
    }

    profit = revenue - expenses;

    setState(() {});
  }

  Widget card(String title, String value, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            const SizedBox(height: 40),

            const Text(
              "CashControl Dashboard",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            card("💰 Revenus", "$revenue FCFA", Colors.green),
            card("🧾 Dépenses", "$expenses FCFA", Colors.red),
            card("📊 Bénéfice", "$profit FCFA",
                profit >= 0 ? Colors.green : Colors.red),

          ],
        ),
      ),
    );
  }
}
