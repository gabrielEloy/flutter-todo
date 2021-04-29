import 'package:flutter/foundation.dart';
import 'package:todo/models/todo_model.dart';

class TodoController extends ChangeNotifier {
  List<TodoModel> todos = [
    TodoModel(id: 0, name: 'Lavar a louça'),
    TodoModel(id: 1, name: 'Comer Arroz'),
  ];

  toggleFinished(TodoModel model) {
    model.isFinished = !model.isFinished;
    notifyListeners();
  }

  upsertTodo() {
    todos.insert(0, TodoModel(id: this.todos.length, name: ''));
    notifyListeners();
  }

  editTodo(TodoModel model, String newName) {
    model.name = newName;
    notifyListeners();
  }

  remove(TodoModel todo) {
    todos.remove(todo);
    notifyListeners();
  }
}
