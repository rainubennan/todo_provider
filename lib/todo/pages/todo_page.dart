import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/todo/providerr/todo_provider.dart';
import '../utility/add_item.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {


  @override
  Widget build(BuildContext context) {
    final task= Provider.of<TodoProvider>(context);

    return Scaffold(
        appBar: AppBar(
            title:Text('ToDo with Provider')),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=> showDialog(
              context: context,
              builder: (context){
                return const AddItem();
              },
          barrierDismissible: false,

          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.add_circle_sharp),),
      body:ListView.builder(
        itemCount: task.allTask.length,
          itemBuilder: (context,index)
      {
        return ListTile(
          leading: Checkbox(
            onChanged: ((_) => task.toggleTask(task.allTask[index])),
            value: task.allTask[index].complete,),
          title: Text(task.allTask[index].todotitle),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: ()=> task.deleteTask(task.allTask[index]),
          ),
        );
      }) ,



    );
  }
}

