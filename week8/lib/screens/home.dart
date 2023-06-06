import 'package:flutter/material.dart';
import 'package:week8/constants/colors.dart';
import 'package:week8/model/todo.dart';

import '../widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final todoList = ToDo.generateToDoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todoList;
    super.initState();
  }

  void _addTodoItem(String todoText) {
    setState(() {
      todoList.add(ToDo(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          todoText: todoText));
    });

    _todoController.clear();
  }

  void _deleteTodoItem(String id) {
    setState(() {
      todoList.removeWhere((todoItem) => todoItem.id == id);
    });
  }

  void _handleTodoChange(ToDo toDo) {
    setState(() {
      toDo.isDone = !toDo.isDone;
    });
  }

  void _runFilter(String enteredKeword) {
    List<ToDo> results = [];
    if (enteredKeword.isEmpty) {
      results = todoList;
    } else {
      results = todoList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          "All ToDos",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      for (ToDo todoo in _foundToDo)
                        ToDoItem(
                          todo: todoo,
                          onToDoChanged: _handleTodoChange,
                          onDeleteItem: _deleteTodoItem,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Alt kısımdaki todoItem ekleme kısmı. Aynı zamanda Stack ın 2. elemanı
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 0),
                              blurRadius: 10)
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                          hintText: "Add a new ToDo Item",
                          border: InputBorder.none),
                    ),
                  ),
                ),

                //Rowun 2. elemanı addtodoItem butonu

                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                      onPressed: () {
                        _addTodoItem(_todoController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tdBlue,
                        minimumSize: Size(60, 60),
                        elevation: 10,
                      ),
                      child: Text(
                        "+",
                        style: TextStyle(fontSize: 40),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 1,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          ),
          SizedBox(
            height: 45,
            width: 45,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/images/foto2.jpg")),
          )
        ],
      ),
    );
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              size: 20,
              color: tdBlack,
            ),
            hintText: "Search",
            hintStyle: TextStyle(color: tdGrey)),
      ),
    );
  }
}
