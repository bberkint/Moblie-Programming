import 'package:flutter/material.dart';

class StackMP extends StatelessWidget {
  const StackMP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("StackView"),
        ),
        body: Stack(
          children: [
            Container(
              height: 150,
              color: Colors.green,
            ),
            Container(
              height: 120,
              margin: const EdgeInsets.only(left: 20, top: 100),
              color: Colors.yellow,
            ),
            Positioned(
              left: 30,
              right: 30,
              height: 160,
              child: Container(
                color: Colors.blue,
                child: Text("Positioned Widget"),
              ),
            )
          ],
        ));
  }
}
