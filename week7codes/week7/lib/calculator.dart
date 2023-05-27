import 'package:flutter/material.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  final TextEditingController number1Controller = TextEditingController();
  final TextEditingController number2Controller = TextEditingController();

  final operatiorList = ["+", "-", "*", "/"];
  String? operator;
  double? result = 0;
  String? error = "";
  void _calculate() {
    if (number1Controller.text.isEmpty || number2Controller.text.isEmpty) {
      setState(() {
        error = "You must enter both values";
      });
      return;
    }

    if (operator == null) {
      setState(() {
        error = "You must select the operator type";
      });
      return;
    }

    double number1 = double.parse(number1Controller.text.toString());
    double number2 = double.parse(number2Controller.text.toString());

    switch (operator) {
      case "+":
        result = number1 + number2;
        break;
      case "-":
        result = number1 - number2;
        break;
      case "*":
        result = number1 * number2;
        break;
      case "/":
        result = number1 / number2;
        break;

        error = "";
        setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: number1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Enter Value 1",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: number2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Enter Value 2",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (var op in operatiorList)
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        operator = op;
                      });
                    },
                    color: operator == op ? Colors.blue : Colors.grey,
                    child: Text(
                      op,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: _calculate,
              color: Colors.blue,
              child: Text(
                "Calculate",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Text(
              result.toString(),
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
