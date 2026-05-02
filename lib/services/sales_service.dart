
import 'storage_service.dart';

class SalesService {

  static void saveSale(Map sale) {

    List sales = StorageService.get('sales') ?? [];

    sales.add(sale);

    StorageService.save('sales', sales);
  }

  static List getSales() {
    return StorageService.get('sales') ?? [];
  }

  static double getTotalSales() {

    List sales = getSales();

    double total = 0;

    for (var s in sales) {
      total += (s['price'] ?? 0).toDouble();
    }

    return total;
  }

  static List getTodaySales() {

    List sales = getSales();

    String today = DateTime.now().toString().substring(0, 10);

    return sales.where((s) {
      return s['time'].toString().startsWith(today);
    }).toList();
  }

}
