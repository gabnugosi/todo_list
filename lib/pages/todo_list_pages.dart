import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  //pode começar com stateles e se for necessário ir para stateful
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'E-mail',
              hintText: 'exemplo@exemplo.com',
              //border: InputBorder.none,
              errorText: null,
              prefixText: 'R\$ ',
              suffixText: 'cm',
              labelStyle: TextStyle(fontSize: 40),
            ),
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.purple),
          ),
        ),
      ),
    );
  }
}
