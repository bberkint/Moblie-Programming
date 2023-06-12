import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultDialogWidget extends StatefulWidget {
  const DefaultDialogWidget({super.key});

  @override
  State<DefaultDialogWidget> createState() => _DefaultDialogWidgetState();
}

class _DefaultDialogWidgetState extends State<DefaultDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Sheet"),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: Text("Select your app theme"),
              subtitle: Text("Dark/Light Mode"),
              onTap: () {
                Get.bottomSheet(Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.light_mode,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Light Mode",
                          style: TextStyle(color: Colors.white),
                        ),
                        tileColor: Colors.black,
                        onTap: () {
                          Get.changeTheme(ThemeData.light());
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.dark_mode,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Dark Mode",
                          style: TextStyle(color: Colors.white),
                        ),
                        tileColor: Colors.black,
                        onTap: () {
                          Get.changeTheme(ThemeData.dark());
                        },
                      )
                    ],
                  ),
                ));
              },
            ),
          )
        ],
      ),
    );
  }
}



/*
  DEFAULT DIALOG
Scaffold(
      appBar: AppBar(
        title: const Text("GetX Dailog Alert"),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: Text("GetX Dailog Alert"),
              subtitle: Text("GetX Dailog Alert with GETX"),
              onTap: () {
                Get.defaultDialog(
                    title: "Delete Chat",
                    middleText: "Are you sure?",
                    content: Column(
                      children: [
                        Text("File 1"),
                        Text("File 2"),
                        Text("File 3"),
                      ],
                    ),
                    confirm: TextButton(onPressed: () {}, child: Text("OK!")),
                    cancel: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("CLOSE!")),
                    titlePadding: EdgeInsets.only(top: 20),
                    contentPadding: EdgeInsets.all(10));
              },
            ),
          )
        ],
      ),
    );

*/