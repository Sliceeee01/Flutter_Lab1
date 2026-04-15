import 'dart:ffi';
import 'dart:io';
import 'package:todo_app/todo_repository.dart';
import 'package:todo_app/todo.dart';

void main() {
  TodoRepository repo = TodoRepository();
  printMenu();
  while (true) {
    stdout.write("> ");
    String? input = stdin.readLineSync();
    if (input == null){
continue;
    }
    input = input.trim();
    if (input.isEmpty) {
      continue;
    }
    bool shouldExit = handleCommand(repo, input);
    if (shouldExit){
      break;
    }
    void printMenu() {
      print("Консольное приложение TODO");
      print("Команды: ");
      print("add <текст>        -добавить задачу");
      print("list        -показать список");
      print("done <id>        -отметить выполненной");
      print("delete <id>        -удалить задачу");
      print("exit        -выход");
      print("");
    }
    void addCommand(TodoRepository repo, String input){
      if (input.length <= 4) {
        print("Ошибка: введите текст задачи");
        return;
      }
      String title = input.substring(4).trim();
      repo.add(title);
      print("Задача не добавлена");
    }
  }
  void listCommand(TodoRepository repo){
    List<Todo> todos = repo.getAll();
    if (todos.isEmpty){
      print("Список задач пуст");
      return;
    }
    for (var todo in todos) {
      print (todo);
    }
  }

  void doneCommand(TodoRepository repo, List<String> parts){
    if (parts.length < 2){
      print("Ошибка: укажите id");
    }

  }
}

// void main() {
//   String name = 'Диана';
//   String? name2 = null;

//   var count = 0;
//   var title = 'Учить Rust';

//   var x = 5;
//   // x = 'text';
//   final id = 1;

//   const appName = 'TodoApp';
//   print('$name,$name2,$count,$title,$id,$appName,');
 
//  List<String> tags = ['институт', 'дом'];
//  Map<String, dynamic> data = {'key': 'value', 'num': 13};
//  Set<int> ids = {1, 2, 3};

//  dynamic anything = 42;
//  anything = 'now a string';

//  String greet(String name) => 'Hello, $name!';
//  void printTodo({required String title, bool done = false}) {
//   print('${done ? '+' : '-'} $title');
//  }
//  printTodo(title: 'Купить молоко');
//  printTodo(title: 'Проверить код', done: true);

//  String repeat(String s, [int times = 2]) => s * times;
// }

// class Todo {
//   final int id;
//   String title;
//   bool isDone;
//   Todo({required this.id, required this.title, this.isDone = false});
//   Todo.empty() : id = 0, title = '',
//   isDone = false;
//   @override
//   String toString() => '${isDone ? '+' : '-'} [$id] $title';
//}