import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todo_provider.dart';

class TodoTile extends StatelessWidget{
  final Todo todo;

  const TodoTile({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (_) {
          context.read<TodoProvider>().toggleTodo(todo.id);
        },
      ),
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
          
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: () {
          context.read<TodoProvider>().deleteTodo(todo.id);
        },
      ),
    );
    
  }
}