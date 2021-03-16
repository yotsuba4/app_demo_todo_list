class Todo {
  int _id;
  String _content;
  int get id => this._id;

  set id(int value) => this._id = value;

  get content => this._content;

  set content(value) => this._content = value;
  Todo.fromData(id, content) {
    _id = id;
    _content = content;
  }

  Map<String, dynamic> toMap() {
    return {'id': _id, 'content': _content};
  }
}
