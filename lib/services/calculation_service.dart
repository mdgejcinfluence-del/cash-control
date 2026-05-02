
import '../models/business_model.dart';

class CalculationService {

  static double calculateDailyExpenses(List<Expense> expenses) {
    double total = 0;
    for (var e in expenses) {
      total += e.amount;
    }
    return total;
  }

  static double calculateEmployeeCost(List<Employee> employees) {
    double total = 0;

    for (var e in employees) {
      if (!e.isCommission) {
        total += e.salaryOrCommission / 30;
      }
    }

    return total;
  }

  static double calculateCommission(List<Employee> employees, List<Service> services, int totalServices) {
    double total = 0;

    for (var s in services) {
      if (s.employeeShare != null) {
        total += s.employeeShare! * totalServices;
      }
    }

    return total;
  }

  static double calculateNetProfit({
    required double revenue,
    required double expenses,
    required double employeeCost,
    required double commission,
    required double dailyFixedCost,
  }) {
    return revenue - expenses - employeeCost - commission - dailyFixedCost;
  }
}
