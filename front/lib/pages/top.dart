import 'package:flutter/material.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/memo.png',
            width: 200,
            color: const Color.fromARGB(120, 255, 255, 255),
          ),
          const SizedBox(height: 40),
          const Text(
            'Flutter練習用のメモアプリです',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '使用技術 \n Flutter + FastAPI +MySQL',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            )
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: () {
              //処理書く
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white
            ),
            icon: const Icon(Icons.login_rounded),
            label: const Text('始める')
          ),
        ],
      ),
    );
  }
}