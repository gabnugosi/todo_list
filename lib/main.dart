import "dart:developer";

import "package:flutter/material.dart";
import "package:todo_list/pages/todo_list_pages.dart";

void main(){
  runApp(const MyApp()); //função que roda o aplicativo 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoListPage(),
    );
  }
}

