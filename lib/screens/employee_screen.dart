
import 'package:flutter/material.dart';
import '../services/business_service.dart';
import '../services/sales_service.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {

  String? selectedEmployee;
  String? selectedService;
  double total = 0;

  void addSale() {

    if (selectedEmployee == null || selectedService == null) return;

    double price = 3000; // temporaire (lié service ensuite)

    Map sale = {
      "employee": selectedEmployee,
      "service": selectedService,
      "price": price,
      "time": DateTime.now().toString(),
    };

    SalesService.saveSale(sale);

    setState(() {
      total += price;
    });
  }

  Widget dropdown(String hint, List<String> items, Function(String?) onChange) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: DropdownButton<String>(
        value: null,
        hint: Text(hint),
        isExpanded: true,
        underline: const SizedBox(),
        items: items.map((e) {
          return DropdownMenuItem(
            value: e,
            child: Text(e),
          );
        }).toList(),
        onChanged: onChange,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    List<String> employees = BusinessService.getEmployees()
        .map((e) => e['name'].toString()).toList();

    List<String> services = BusinessService.getServices()
        .map((e) => e['name'].toString()).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 40),

            const Text(
              "Nouvelle Vente",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            dropdown("Employé", employees, (v) {
              selectedEmployee = v;
            }),

            dropdown("Service", services, (v) {
              selectedService = v;
            }),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: addSale,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "VALIDER VENTE",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Total aujourd’hui : $total FCFA",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
