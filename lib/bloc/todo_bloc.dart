import 'dart:async';
import 'dart:math';

import 'package:app_demo_todo/base/base_bloc.dart';
import 'package:app_demo_todo/base/base_event.dart';
import 'package:app_demo_todo/event/add_todo_event.dart';
import 'package:app_demo_todo/event/delete_todo_event.dart';
import 'package:app_demo_todo/model/todo.dart';
import 'package:app_demo_todo/repo/todo_repo.dart';

class TodoBloc extends BaseBloc {
  // TodoTable _todoTable = TodoTable();
  TodoRepo _todoRepo = TodoRepo();

  StreamController<List<Todo>> _todoListStreamController =
      StreamController<List<Todo>>();
  Stream<List<Todo>> get todoListStream => _todoListStreamController.stream;
  var _randomInt = Random();
  List<Todo> _todoListData = [];

  _addTodo(Todo todo) async {
    //insert to database
    /*  await _todoTable.insertTodo(todo);
    _todoListData.add(todo);
    _todoListStreamController.sink.add(_todoListData); */
    await _todoRepo.insertTodo(todo);
    _todoListData.add(todo);
    _todoListStreamController.sink.add(_todoListData);
  }

  _deleteTodo(Todo todo) async {
    /* await _todoTable.deleteTodo(todo);
    _todoListData.remove(todo);
    _todoListStreamController.sink.add(_todoListData); */
    await _todoRepo.deleteTodo(todo);
    _todoListData.remove(todo);
    _todoListStreamController.sink.add(_todoListData);
  }

  initData() async {
    /* _todoListData = await _todoTable.selectAllTodo();
    if (_todoListData == null) {
      return;
    }
    _todoListStreamController.sink.add(_todoListData); */
    var data = await _todoRepo.initData();
    _todoListStreamController.sink.add(data);
  }

  @override
  void dispatchEvent(BaseEvent event) {
    if (event is AddTodoEvent) {
      // print(event.content);
      Todo todo = Todo.fromData(_randomInt.nextInt(1000000), event.content);
      _addTodo(todo);
    } else if (event is DeleteTodoEvent) {
      _deleteTodo(event.todo);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _todoListStreamController.close();
  }
}
