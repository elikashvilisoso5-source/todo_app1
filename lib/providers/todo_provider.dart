import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class TodoProvider extends ChangeNotifier{
  final List<Todo> _todos = []; // აქ ინახება ყველა Task.

  List<Todo> get todos => _todos; // UI-ს ვაძლევთ წვდომას Task-ების სიაზე.

  void addTodo(String title) {                 //ამატებს ახალ Task-ს.
    if(title.trim().isEmpty) return;

    final newTodo = Todo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
    );

    _todos.add(newTodo);
    notifyListeners();        // notifyListeners(); ეუბნება UI-ს: მონაცემი შეიცვალა, თავიდან გადახატე.
  }

void toggleTodo(String id) {                 // ცვლის Task-ის Completed სტატუსს.
  final index = _todos.indexWhere((todo) => todo.id ==id);
  if (index == -1) return;

  _todos[index].isCompleted = !_todos[index].isCompleted;
  notifyListeners();
}

void deleteTodo(String id) {                 // შლის Task-ს.
  _todos.removeWhere((todo) => todo.id == id);
  notifyListeners();
}

}