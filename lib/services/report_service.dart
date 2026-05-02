
import 'sales_service.dart';
import 'business_service.dart';

class ReportService {

  static Map generateDailyReport() {

    var sales = SalesService.getTodaySales();
    var expenses = BusinessService.getExpenses();
    var employees = BusinessService.getEmployees();

    double totalSales = SalesService.getTotalSales();

    double totalExpenses = 0;
    for (var e in expenses) {
      totalExpenses += (e['amount'] ?? 0).toDouble();
    }

    return {
      "date": DateTime.now().toString(),
      "sales_count": sales.length,
      "total_sales": totalSales,
      "total_expenses": totalExpenses,
      "sales": sales,
    };
  }

  static String generateJsonReport() {
    return generateDailyReport().toString();
  }
}
