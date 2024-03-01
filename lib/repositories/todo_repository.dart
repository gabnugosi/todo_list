import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/models/todo.dart';

class TodoRepository{
  TodoRepository(){
    SharedPreferences.getInstance().then((value) => sharedPreferences = value);
  }
  late SharedPreferences sharedPreferences;

  void saveTodoList(List<Todo> todos){
    final jsonString = json.encode(todos);
    sharedPreferences.setString('todo_list', jsonString);
    log(jsonString);
  }
}