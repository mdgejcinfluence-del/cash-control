
import 'package:share_plus/share_plus.dart';
import 'report_service.dart';

class WhatsAppService {

  static void sendDailyReport() {

    var report = ReportService.generateDailyReport();

    String message = '''

📊 CASHCONTROL RAPPORT JOURNALIER

👥 Ventes : ${report['sales_count']}
💰 Total ventes : ${report['total_sales']} FCFA
🧾 Dépenses : ${report['total_expenses']} FCFA

━━━━━━━━━━━━━━
✔ Généré automatiquement par CashControl
''';

    Share.share(message);
  }
}
