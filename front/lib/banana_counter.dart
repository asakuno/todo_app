import  'package:flutter/material.dart';

class BananaCounter extends StatelessWidget {
  final int number;
  const BananaCounter({required this.number, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final banana = Image.asset('images/banana2.png');

    final text = Text('$number',);

    final row = Row(children: [
      banana,
      text,
    ]);

    final con = Container(
      color: Colors.blue,
      child: row,
    );

    return con;
  }
}