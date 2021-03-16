import 'package:app_demo_todo/base/base_event.dart';
import 'package:app_demo_todo/model/todo.dart';

class DeleteTodoEvent extends BaseEvent {
  Todo _todo;

  // ignore: unnecessary_getters_setters
  Todo get todo => _todo;

  // ignore: unnecessary_getters_setters
  set todo(Todo value) {
    _todo = value;
  }

  DeleteTodoEvent(this._todo);
}
