import 'package:calculator/provider/calculation_provider.dart';
import 'package:calculator/view/calculator_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => CalculationProvider(),),
    ],child:  const MaterialApp(
      home: CalculatorView(),
      debugShowCheckedModeBanner: false,
    ),);
  }
}
