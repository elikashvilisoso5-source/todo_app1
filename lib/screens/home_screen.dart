import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/widgets/todo_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showAddTodoDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: const Text('ახალი Task'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'შეიყვანე Task...',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('გაუქმება'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<TodoProvider>().addTodo(controller.text);
                Navigator.pop(context);
              },
              child: const Text('დამატება'),
            ),
          ],
        );
      },
    );
  }


@override
Widget build(BuildContext context) {
  final todos = context.watch<TodoProvider>().todos;

  return Scaffold(
    appBar: AppBar(
      title: const Text('To-Do App'),
      centerTitle: true,
    ),
    body: todos.isEmpty
        ? const Center(
          child: Text(
            style: TextStyle(fontSize: 18),
          ),
        )
      : ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return TodoTile(todo: todos[index]);
          },
        ),
    floatingActionButton: FloatingActionButton(
      onPressed: () => _showAddTodoDialog(context),
      child: const Icon(Icons.add),
    ),
  );
}
}