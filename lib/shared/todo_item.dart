import 'package:flutter/material.dart';
import 'package:todo/constants/app_styles.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/shared/circular_check.dart';

class TodoItem extends StatelessWidget {
  TodoModel todo;
  VoidCallback onTap;
  Function editedText;


  TextEditingController textController;


  TodoItem({this.todo, this.onTap, this.editedText}){
    textController = TextEditingController(text: todo.name); 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(60),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[200],
                spreadRadius: 3,
                blurRadius: 20,
                offset: Offset(0, 5))
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write a todo here (press to edit)'
                ),
                style: TextStyle(decoration: todo.isFinished ? TextDecoration.lineThrough : null),
                onSubmitted: (text){
                  editedText(text);
                },
              ),
            ),
            Container(
              child: CircularCheck(
                isSelected: todo.isFinished,
                onTap: onTap,
              ),
            )
          ],
        ),
      ),
    );
  }
}
