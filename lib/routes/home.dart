import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/constants/app_styles.dart';
import 'package:todo/controllers/todo_controller.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/shared/todo_item.dart';

class HomeRoute extends StatefulWidget {
  HomeRoute({Key key}) : super(key: key);

  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  _listBuilder(TodoController todoController) {
    return ListView.builder(
      itemCount: todoController.todos.length,
      itemBuilder: (context, index) =>
          _itemBuilder(todoController.todos[index], todoController),
    );
  }

  _itemBuilder(TodoModel todo, TodoController todoController) {
    return Column(
      children: [
        SizedBox(height: 15),
        TodoItem(
            todo: todo,
            onTap: () => todoController.toggleFinished(todo),
            editedText: (String text) => todoController.editTodo(todo, text))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoController>(context);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('All Tasks'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child:
              Consumer<TodoController>(builder: (context, todoController, _) {
            return _listBuilder(todoController);
          }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 35,
          ),
          onPressed: () {
            todoProvider.upsertTodo();
          },
          backgroundColor: AppColors.actionButton,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
