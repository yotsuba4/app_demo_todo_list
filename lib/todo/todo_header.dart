import 'package:app_demo_todo/bloc/todo_bloc.dart';
import 'package:app_demo_todo/event/add_todo_event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToDoHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var txtToDoController = TextEditingController();
    var bloc = Provider.of<TodoBloc>(context);
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: txtToDoController,
            decoration: InputDecoration(
              labelText: 'Add to do',
              hintText: 'Add to do',
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        ElevatedButton.icon(
          onPressed: () {
            bloc.event.add(AddTodoEvent(txtToDoController.text));
          },
          icon: Icon(Icons.add),
          label: Text('Add'),
        ),
      ],
    );
  }
}
