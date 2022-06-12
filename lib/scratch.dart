// ignore_for_file: unused_import, unused_local_variable

import 'dart:io';

void main() {
  performTasks();
}

void performTasks() {
  task1();
  String taskk = task2();
  task3(taskk);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

String task2() {
  String results;
  results = 'task 2 data';
  return results;
}

void task3(String task2Func) {
  String result = 'task 3 data';
  print('Task 3 complete $task2Func');
}
