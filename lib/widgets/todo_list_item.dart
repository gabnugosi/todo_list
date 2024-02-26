import 'package:flutter/material.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey[200],
      ),
      margin: const EdgeInsets.symmetric(vertical: 2),//espaçamento fora do container
      padding: const EdgeInsets.all(16), //espaçãmento dentro do container
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '20/11/2015',
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
