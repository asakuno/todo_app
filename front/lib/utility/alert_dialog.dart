import 'package:flutter/material.dart';
import 'package:front/repository/todo_request.dart';

class AlertDialogDelete extends StatelessWidget {
  final TodoRequest todoRequest;
  final int todoId;
  final VoidCallback onDeleted;
  const AlertDialogDelete(
      {Key? key,
      required this.todoRequest,
      required this.todoId,
      required this.onDeleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(15),
      title: const Text('データを削除します'),
      content: const Text('本当によろしいですか？'),
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 213, 26, 26)),
          ),
          child: const Text(
            'いいえ',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 31, 160, 215)),
          ),
          child: const Text(
            'はい',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () async {
            await todoRequest.deleteTodoData(todoId);
            Navigator.pop(context);
            onDeleted();
          },
        )
      ],
    );
  }
}
