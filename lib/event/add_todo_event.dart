import 'package:app_demo_todo/base/base_event.dart';

class AddTodoEvent extends BaseEvent {
  String _content;

  String get content => _content;

  AddTodoEvent(this._content);
}
