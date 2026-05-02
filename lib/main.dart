
import 'package:flutter/material.dart';
import 'app_router.dart';

void main() {
  runApp(const CashControlApp());
}

class CashControlApp extends StatelessWidget {
  const CashControlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CashControl Cloud',
      theme: ThemeData.dark(),
      initialRoute: '/',
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
