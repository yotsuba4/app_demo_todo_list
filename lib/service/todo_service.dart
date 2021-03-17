import 'package:app_demo_todo/model/todo.dart';

class TodoService {
  Future<List<Todo>> getTodoList() async {
    return [
      Todo.fromData(1, 'content1'),
      Todo.fromData(2, 'content2'),
    ];
  }
}
