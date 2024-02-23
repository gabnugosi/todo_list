import 'package:flutter/material.dart';
import 'dart:developer';

class TodoListPage extends StatelessWidget {
  //pode começar com stateles e se for necessário ir para stateful
  TodoListPage({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Adicione uma tarefa',
                    hintText: 'Teste de hint',
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              ElevatedButton(
                onPressed: null,
                child: Text('+'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    String text = emailController.text;
    log('emailController = $text');
  }

  void onChanged(String text) {
    log('onChanged = $text');
  }

  void onSubmitted(String text) {
    log('onSubmitted = $text');
  }
}
