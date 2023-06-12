import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.snackbar("Warning", "Check Comments",
              backgroundColor: Colors.blue,
              colorText: Colors.white,
              duration: Duration(seconds: 5),
              snackPosition: SnackPosition.BOTTOM,
              messageText: Image.network("https://picsum.photos/200/300"),
              titleText: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add_a_photo),
                  label: Text("Add a photo")));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
