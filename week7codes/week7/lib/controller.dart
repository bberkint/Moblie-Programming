import 'package:flutter/material.dart';

class Controller extends StatefulWidget {
  final String title;
  const Controller({super.key, required this.title});

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  TextEditingController controller = TextEditingController();
  late String _message = "----------";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Controller"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        height: 250,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _message,
              style: const TextStyle(fontSize: 25, color: Colors.green),
            ),
            TextField(
              controller: controller,
              autofocus: true,
              cursorColor: Colors.yellow,
              style: TextStyle(color: Colors.blue),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.lightGreen,
                  hintText: "Write Something"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _message = controller.text;
                });
              },
              child: Text("Change"),
            ),
          ],
        ),
      ),
    );
  }
}
