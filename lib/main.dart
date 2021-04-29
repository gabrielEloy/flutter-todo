import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/controllers/todo_controller.dart';
import 'package:todo/routes/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoController>(create: (_) => TodoController())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeRoute(),
      ),
    );
  }
}
