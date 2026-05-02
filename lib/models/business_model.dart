
class Expense {
  String name;
  double amount;

  Expense({required this.name, required this.amount});
}

class Employee {
  String name;
  bool isCommission;
  double salaryOrCommission;

  Employee({
    required this.name,
    required this.isCommission,
    required this.salaryOrCommission,
  });
}

class Service {
  String name;
  double price;
  double? employeeShare;

  Service({
    required this.name,
    required this.price,
    this.employeeShare,
  });
}
