
class BusinessData {

  List<Map> expenses = [];
  List<Map> employees = [];
  List<Map> services = [];

  BusinessData({
    required this.expenses,
    required this.employees,
    required this.services,
  });

  Map<String, dynamic> toJson() {
    return {
      'expenses': expenses,
      'employees': employees,
      'services': services,
    };
  }

  factory BusinessData.fromJson(Map data) {
    return BusinessData(
      expenses: List<Map>.from(data['expenses'] ?? []),
      employees: List<Map>.from(data['employees'] ?? []),
      services: List<Map>.from(data['services'] ?? []),
    );
  }
}
