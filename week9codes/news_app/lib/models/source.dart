class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

//Map<String , dynamic> user;  firstName: Berkin  lastName: Topaloğlu  age: 23
  Source.fromJSON(Map<String, dynamic> sourceJson) {
    id = sourceJson["id"];
    name = sourceJson["name"];
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> sourceJSON = <String, dynamic>{};

    sourceJSON["id"] = id; //{"id" : "merhaba131313"}
    sourceJSON["name"] = name; // {"id" : "merhaba131313" , "name":"berkin...."}
    return sourceJSON;
  }
}


//myData = {"id" : "m131313" , "name" : "myname"}    Bu bir jsondur
//Source.fromJSON(myData) => Source(id:m131313, name: myname)  bu ise sourcedan oluşturulmuş bir nesnedir