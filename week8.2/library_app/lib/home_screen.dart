import 'package:flutter/material.dart';
import 'package:library_app/db_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  Future<void> _addBook() async {
    await SQLHelper.createBook(_titleController.text, _descController.text);
    _refreshData();
  }

  Future<void> _updateBook(int id) async {
    await SQLHelper.updateBook(id, _titleController.text, _descController.text);
    _refreshData();
  }

  Future<void> _deleteBook(int id) async {
    await SQLHelper.deleteBook(id);
    _refreshData();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Book Deleted")));
  }

  List<Map<String, dynamic>> _allbooks = [];

  bool _isLoading = true;

  Future<void> _refreshData() async {
    //refreshData çalıştırdığım yerde veritabanından tüm veriler çekilir ve ekrandaki kitaplar güncellenir
    final books = await SQLHelper.getAllData();

    setState(() {
      _allbooks = books;
      _isLoading = false; // veri tabanından veri çekme işlemi tamamlanmıştır
    });
  }

  void showButtonSheetBook(int? id) {
    // id doluysa güncelleme işlemi eğer boşsa yeni kayıt ekleme işlemi
    if (id != null) {
      final existingBook = _allbooks.firstWhere((book) => book["id"] == id);
      _titleController.text = existingBook["title"];
      _descController.text = existingBook["desc"];
    } else {
      //id null ise güncelleme yok. yeni kayıt eklenecek . bu yüzden text alanları boş olur
      _titleController.clear();
      _descController.clear();
    }

    showModalBottomSheet(
      context: context,
      elevation: 0,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: EdgeInsets.only(
            top: 30,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Title"),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: _descController,
              maxLines: 5,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Description"),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (id == null) {
                    await _addBook();
                  } else {
                    await _updateBook(id);
                  }
                  _descController.clear();
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Text(
                    id == null ? "Add Book" : "Update",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KBU Library"),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _allbooks.length,
              itemBuilder: (context, index) => Card(
                margin: EdgeInsets.all(5),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      _allbooks[index]["title"],
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  subtitle: Text(_allbooks[index]["desc"]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            showButtonSheetBook(_allbooks[index]["id"]);
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.indigo,
                          )),
                      IconButton(
                          onPressed: () {
                            _deleteBook(_allbooks[index]["id"]);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showButtonSheetBook(null);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
