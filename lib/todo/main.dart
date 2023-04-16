import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/todo/pages/todo_page.dart';
import 'package:todo/todo/providerr/todo_provider.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(


      create: (( context) =>TodoProvider()),
      child: MaterialApp(
          home: ToDoPage(),
          debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch:Colors.lightGreen),

      ),
    );
  }
}