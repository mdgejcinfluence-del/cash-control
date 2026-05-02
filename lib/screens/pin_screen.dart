
import 'package:flutter/material.dart';
import '../services/pin_service.dart';
import 'dashboard_screen.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {

  String pin = "";
  String confirmPin = "";
  bool isCreating = false;
  String error = "";

  @override
  void initState() {
    super.initState();
    checkMode();
  }

  void checkMode() async {
    bool hasPin = await PinService.hasPin();
    setState(() {
      isCreating = !hasPin;
    });
  }

  void onNumberTap(String value) {
    if (pin.length < 4) {
      setState(() {
        pin += value;
      });
    }
  }

  void onDelete() {
    if (pin.isNotEmpty) {
      setState(() {
        pin = pin.substring(0, pin.length - 1);
      });
    }
  }

  void validate() async {

    if (pin.length != 4) return;

    if (isCreating) {

      if (confirmPin.isEmpty) {
        setState(() {
          confirmPin = pin;
          pin = "";
          error = "Confirmez le PIN";
        });
        return;
      }

      if (confirmPin == pin) {
        await PinService.savePin(pin);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const DashboardScreen()),
        );

      } else {
        setState(() {
          error = "PIN non identique";
          pin = "";
          confirmPin = "";
        });
      }

    } else {

      bool ok = await PinService.checkPin(pin);

      if (ok) {

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const DashboardScreen()),
        );

      } else {
        setState(() {
          error = "PIN incorrect";
          pin = "";
        });
      }
    }
  }

  Widget buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (i) {
        return Container(
          margin: const EdgeInsets.all(8),
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: i < pin.length ? Colors.green : Colors.grey,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }

  Widget num(String v) {
    return GestureDetector(
      onTap: () => onNumberTap(v),
      child: Container(
        margin: const EdgeInsets.all(8),
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(v,
              style: const TextStyle(color: Colors.white, fontSize: 24)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            isCreating ? "🔐 Créer PIN" : "🔓 Entrer PIN",
            style: const TextStyle(color: Colors.white, fontSize: 22),
          ),

          const SizedBox(height: 30),

          buildDots(),

          const SizedBox(height: 20),

          Text(error, style: const TextStyle(color: Colors.orange)),

          const SizedBox(height: 20),

          Wrap(
            children: [
              num("1"), num("2"), num("3"),
              num("4"), num("5"), num("6"),
              num("7"), num("8"), num("9"),
              num("0"),
            ],
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: validate,
            child: const Text("OK"),
          )

        ],
      ),
    );
  }
}
