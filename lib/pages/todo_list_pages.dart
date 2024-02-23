import 'package:flutter/material.dart';
import 'dart:developer';

class TodoListPage extends StatefulWidget {
  //pode começar com stateles e se for necessário ir para stateful
  //agora mudou para stateful, pois foi necessário guardar o estado da variável para aplicar na lista de tarefas
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();

  List<String> todos = [];

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
                  Expanded(
                    child: TextField(
                      controller: todoController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adicione uma tarefa',
                        hintText: 'Ex: Ir ao mercado',
                      ),
                    ),
                  ),
                  //Sizedbox para o espaço entre o campo de texto e o botão da row
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String text = todoController.text;
                      setState(
                        () {
                          todos.add(
                              text); // insere o texto da variável todoController do Campo TextField a cima na lista de tarefas
                        },
                      );
                      todoController.clear();
                    },
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
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (String todo in todos)
                      ListTile(
                        title: Text(todo),
                        onTap: () {
                          log('Tarefa: $todo');
                        },
                      ),
                  ],
                ),
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
}
