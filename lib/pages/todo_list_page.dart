import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  //pode começar com stateles e se for necessário ir para stateful
  //agora mudou para stateful, pois foi necessário guardar o estado da variável para aplicar na lista de tarefas
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();

  List<Todo> todos = [];
  double widthSB = 16;
  double heightSB = 16;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
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
                    SizedBox(
                      width: widthSB,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        String text = todoController.text;
                        setState(
                          () {
                            Todo newTodo =
                                Todo(title: text, dateTime: DateTime.now());
                            todos.add(
                                newTodo); // insere o texto da variável todoController do Campo TextField a cima na lista de tarefas
                          },
                        );
                        todoController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 39, 174, 228),
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
                SizedBox(
                  height: heightSB,
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (Todo todo in todos)
                        TodoListItem(todo: todo, onDelete: onDelete),
                    ],
                  ),
                ),
                //SizedBox para espaçar as linhas
                SizedBox(
                  height: heightSB,
                ),
                Row(
                  children: [
                    Expanded(
                      child:
                          Text('Você possui ${todos.length} tarefas pendentes'),
                    ),
                    //Sizedbox para o espaço entre o campo de texto e o botão da row
                    SizedBox(
                      width: widthSB,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 39, 174, 228),
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
      ),
    );
  }

  void onDelete(Todo todo) {
    setState(() {
      todos.remove(todo);  
    });
  }
}
