import 'package:app_demo_todo/bloc/todo_bloc.dart';
import 'package:app_demo_todo/event/delete_todo_event.dart';
import 'package:app_demo_todo/model/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var bloc = Provider.of<TodoBloc>(context);
    bloc.initData();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<TodoBloc>(
        builder: (context, bloc, child) => StreamBuilder<List<Todo>>(
            stream: bloc.todoListStream,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          snapshot.data[index].content,
                          style: TextStyle(fontSize: 17),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            bloc.event
                                .add(DeleteTodoEvent(snapshot.data[index]));
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red[400],
                          ),
                        ),
                      );
                    },
                  );
                case ConnectionState.waiting:
                  return Center(
                    child: Container(
                      width: 70,
                      height: 70,
                      child: Text(
                        'Empty',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  );
                case ConnectionState.none:
                default:
                  return Center(
                    child: Container(
                      width: 70,
                      height: 70,
                      child: CircularProgressIndicator(),
                    ),
                  );
              }
            }),
      ),
    );
  }
}
