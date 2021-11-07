import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:todo_app/feature/todo/domain/entity/todo.dart';
import 'package:http/http.dart' as http;

String baseUrl = 'jsonplaceholder.typicode.com';
String endpoint = '/todos';

List<ToDo> parseToDo(String responseBody) {
  final parsed = convert.jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<ToDo>((json) => ToDo.fromJson(json)).toList();
}

Future<List<ToDo>> fetchTodos() async {
  var uri = Uri.https(baseUrl, endpoint);

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    return compute(parseToDo, response.body);
  } else {
    throw Exception('Failed to load data');
  }
}
