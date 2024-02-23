import 'package:flutter/material.dart';
import 'dart:developer';

class TodoListPage extends StatelessWidget {
  //pode começar com stateles e se for necessário ir para stateful
  TodoListPage({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adicione uma tarefa',
                        hintText: 'Teste de hint',
                      ),
                    ),
                  ),
                  //Sizedbox para o espaço entre o campo de texto e o botão da row
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 39, 174, 228),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(17),
                      shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(2),
                        ),
                      ),
                    ),
                    child: const Icon(Icons.add, size: 30),
                  ),
                ],
              ),
              //SizedBox para espaçar as linhas
              const SizedBox(
                height: 15,
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    color: Colors.red,
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    color: Colors.yellow,
                    height: 50,
                  ),
                  Container(
                    color: Colors.green,
                    height: 50,
                  ),
                  Container(
                    color: Colors.blue,
                    height: 50,
                  ),
                ],
              ),
              //SizedBox para espaçar as linhas
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text('Você possui 0 tarefas pendentes'),
                  ),
                  //Sizedbox para o espaço entre o campo de texto e o botão da row
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 39, 174, 228),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(17),
                      shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(2),
                        ),
                      ),
                    ),
                    child: const Text('Limpar Tudo'),
                  ),
                ],
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
