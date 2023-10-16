import 'dart:convert';
import 'package:http/http.dart' as http;
import '../entity/todo/todo_item_request.dart';

// class TodoRequestv{
//   Uri url = Uri.parse('http://127.0.0.1:8080/tasks');

//   Future<TodoItemRequest> createTodo() async {
//     http.Response response = await http.post(url);

//     if (response.statusCode == 200) {

//     }
//   }
// }