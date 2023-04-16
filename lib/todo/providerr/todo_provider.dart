import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo/todo/model/todo_model.dart';

class TodoProvider with ChangeNotifier{
  List tasklist=[];
  UnmodifiableListView get allTask => UnmodifiableListView(tasklist);

  void addTask(String task){
    tasklist.add(TodoModel(todotitle: task,complete: false));
    notifyListeners();
  }

  toggleTask( task) {
    final taskIndex = tasklist.indexOf(task);
    tasklist[taskIndex].toggleCompleted();
    notifyListeners();
  }

  deleteTask(task) {
    tasklist.remove(task);
    notifyListeners();
  }
}