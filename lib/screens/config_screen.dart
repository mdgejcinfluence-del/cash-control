
import 'package:flutter/material.dart';
import '../services/business_service.dart';

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({super.key});

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {

  List<Map> expenses = [];
  List<Map> employees = [];
  List<Map> services = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    expenses = BusinessService.getExpenses();
    employees = BusinessService.getEmployees();
    services = BusinessService.getServices();
    setState(() {});
  }

  void addExpense() {
    expenses.add({"name": "Frais", "amount": 0});
    BusinessService.saveExpenses(expenses);
    setState(() {});
  }

  void addEmployee() {
    employees.add({"name": "Employé", "type": "salary", "value": 0});
    BusinessService.saveEmployees(employees);
    setState(() {});
  }

  void addService() {
    services.add({"name": "Service", "price": 0, "share": 0});
    BusinessService.saveServices(services);
    setState(() {});
  }

  Widget buildList(String title, List<Map> items, Function onAdd) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      color: Colors.white10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(title, style: const TextStyle(color: Colors.white)),

          const SizedBox(height: 10),

          ...items.map((e) => Text(e.toString(),
              style: const TextStyle(color: Colors.white70))),

          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: () => onAdd(),
            child: const Text("Ajouter"),
          )

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 40),

            const Text(
              "⚙️ CONFIG ENTREPRISE",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),

            const SizedBox(height: 20),

            buildList("🏠 Frais", expenses, addExpense),
            buildList("👤 Employés", employees, addEmployee),
            buildList("🛠️ Services", services, addService),

          ],
        ),
      ),
    );
  }
}
