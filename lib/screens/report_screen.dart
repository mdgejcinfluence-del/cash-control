
import 'package:flutter/material.dart';
import '../services/report_service.dart';
import '../services/whatsapp_service.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var report = ReportService.generateDailyReport();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 40),

            const Text(
              "Rapport Journalier",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            _card("Ventes du jour", "${report['sales_count']}"),
            _card("Chiffre d'affaires", "${report['total_sales']} FCFA"),
            _card("Dépenses", "${report['total_expenses']} FCFA"),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  WhatsAppService.sendDailyReport();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "ENVOYER AU PATRON",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _card(String title, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
