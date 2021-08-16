import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudapp/model/todo.dart';

class DatabaseService {
  CollectionReference todoCollection =
      FirebaseFirestore.instance.collection("Todos");

  Future createNewTodo(String title) async {
    return await todoCollection.add({
      "title": title,
      "isComplete": false,
    });
  }

  Future completeTask(uid) async {
    return await todoCollection.doc(uid).update({"isComplete": true});
  }

  List<Todo> todoFromFirestore(QuerySnapshot snapshot) {
    if (snapshot != null) {
      return snapshot.docs.map((e) {
        return Todo(
          isComplete: e.data()["isComplete"],
          title: e.data()["title"],
          uid: e.id,
        );
      }).toList();
    } else {
      return null;
    }
  }

  Stream<List<Todo>> listTodos() {
    return todoCollection.snapshots().map(todoFromFirestore);
  }
}
