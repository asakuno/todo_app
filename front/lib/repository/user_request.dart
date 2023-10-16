import 'dart:convert';
import 'package:http/http.dart' as http;
import '../entity/user/user.dart';

class UserRequest {
  Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users');

  Future<List<User>> getAllUser() async {
    http.Response response = await http.get(url);

    if (response.statusCode != 200) {
      return <User>[];
    }

    List userMap = jsonDecode(response.body);

    List<User> users = [];

    userMap.forEach((user) {
      users.add(User.fromJson(user));
    });

    return users;
  }
}