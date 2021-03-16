import 'package:app_demo_todo/todo/todo_header.dart';
import 'package:app_demo_todo/todo/todo_list.dart';
import 'package:flutter/material.dart';

class ToDoListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          ToDoHeader(),
          ToDoList(),
        ],
      ),
    );
  }
}
