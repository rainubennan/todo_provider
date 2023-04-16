import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/todo/providerr/todo_provider.dart';

void main(){
  runApp(MaterialApp(home: AddItem(),));
}

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {

  final _titlecontroller= TextEditingController();
  final _descriptioncontroller= TextEditingController();
  String newtask='';
  String newdescription='';

  @override
  void initState(){
    super.initState();
    _titlecontroller.addListener(() {
      newtask=_titlecontroller.text;
    });
    _descriptioncontroller.addListener(() {
      newdescription=_descriptioncontroller.text;
    });
  }
  @override
  void dispose(){
    _titlecontroller.dispose();
    _descriptioncontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:150,
        horizontal: 25),
        child: AlertDialog(

          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('ADD ITEMS',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 10,),
              TextField(
                controller: _titlecontroller,
                maxLines: 1,

                decoration: InputDecoration(
                    label: Text('Add Title',
                      style: TextStyle(
                          fontWeight: FontWeight.bold),)
                ),),
              TextField(
                controller: _descriptioncontroller,
                maxLines:5,
                decoration: InputDecoration(
                    label: Text('Add Description',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),)
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: ()=>
                        Provider.of<TodoProvider>(context,listen: false).addTask(newtask),
                        child: Text('Save',
                      style: TextStyle(color: Colors.black),),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreenAccent)),
                    ElevatedButton(onPressed: ()=>
                        Navigator.of(context).pop(),
                        child: Text('Cancel',
                      style: TextStyle(color: Colors.black),),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreenAccent)),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

