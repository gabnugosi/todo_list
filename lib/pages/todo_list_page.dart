import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/repositories/todo_repository.dart';
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
  final TodoRepository todoRepository = TodoRepository();

  List<Todo> todos = [];
  Todo? deletedTodo; //nullable pois não tem tarefas deletadas inicialmente
  int? deletedTodoPos; // posição da tarefa deletada
  String? errorText = "";
  double widthSB = 16;
  double heightSB = 16;

  @override
  void initState() {
    super.initState();

    todoRepository.getTodoList().then((value) {
      setState(() {
        todos = value;
      });
    });
  }

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
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Adicione uma tarefa',
                          hintText: 'Ex: Ir ao mercado',
                          errorText: errorText,
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 39, 174, 228),
                              width: 2,
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 39, 174, 228),
                          ),
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

                        if (text.isEmpty) {
                          setState(() {
                            errorText = 'O título não pode ser vazio';
                          });
                          return;
                        }
                        setState(
                          () {
                            Todo newTodo =
                                Todo(title: text, dateTime: DateTime.now());
                            todos.add(
                                newTodo); // insere o texto da variável todoController do Campo TextField a cima na lista de tarefas
                            errorText = null;
                            log('Tarefa ${newTodo.title} adicionada');
                          },
                        );
                        todoController.clear();
                        todoRepository
                            .saveTodoList(todos); //salva lista de tarefas
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
                      onPressed: showDeleteTodosConfirmationDialog,
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
    deletedTodo = todo;
    deletedTodoPos = todos.indexOf(todo);

    setState(() {
      todos.remove(todo);
    });
    todoRepository.saveTodoList(todos);

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Tarefa ${todo.title} foi removida com sucesso',
          style: const TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        action: SnackBarAction(
          label: 'Desfazer',
          textColor: Colors.blue,
          onPressed: () {
            setState(() {
              todos.insert(deletedTodoPos!, deletedTodo!);
            });
            todoRepository.saveTodoList(todos);

            log('Desfazer delete ${deletedTodo!.title} na posição $deletedTodoPos');
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  void showDeleteTodosConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Limpar Tudo?'),
        content:
            const Text('Você tem certeza qeu deseja apagar todas as tarefas?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              log('btn Cancelar limpar tudo');
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
              padding: const EdgeInsets.all(17),
            ),
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              log('btn limpar tudo');
              deleteAllTodos();
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
              padding: const EdgeInsets.all(17),
            ),
            child: const Text("Limpar"),
          ),
        ],
      ),
    );
  }

  void deleteAllTodos() {
    setState(() {
      todos.clear();
    });

    todoRepository.saveTodoList(todos);

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Tarefas removidas!',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        duration: Duration(seconds: 5),
      ),
    );
  }
}
