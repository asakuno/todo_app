import 'package:flutter/material.dart';
import 'package:front/banana_counter.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final textField = TextField();
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Center(
          child: ElevatedButton(
            child: const Text("押してね❤️"),
            onPressed: () async {
              //リクエスト先のurl
              Uri url = Uri.parse("http://127.0.0.1:8080/");

              try {
                //リクエストを投げる
                var res = await http.get(url);

                //リクエスト結果をコンソール出力
                debugPrint(res.body);
              } catch (e) {
                //リクエストに失敗した場合は"error"と表示
                debugPrint("error");
              }
            },
          ),
        ));
  }
}


