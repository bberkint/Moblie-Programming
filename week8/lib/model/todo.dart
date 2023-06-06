class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({required this.id, required this.todoText, this.isDone = false});

  static List<ToDo> generateToDoList() {
    return [
      ToDo(id: "01", todoText: "Breakfast With Fam"),
      ToDo(id: "02", todoText: "Check Emails", isDone: true),
      ToDo(id: "03", todoText: "Team Meeting"),
      ToDo(id: "04", todoText: "Work on Mobile Apps for 2h"),
      ToDo(id: "05", todoText: "Morning Exercises", isDone: true),
      ToDo(id: "06", todoText: "Buy Groceries", isDone: true),
    ];
  }
}
