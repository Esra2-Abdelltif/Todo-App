import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_graph_ql/bloc/todo_bloc.dart';
import 'package:todo_graph_ql/bloc/todo_events.dart';

class AddToDoWidget extends StatelessWidget {
  const AddToDoWidget({super.key});

  @override
  Widget build(BuildContext context) {

    GlobalKey<FormState> formkey=GlobalKey<FormState>();
    var idController =TextEditingController();
    var titleController =TextEditingController();
    var contentController =TextEditingController();
    final todoList=BlocProvider.of<ToDoBloc>(context);

    return FloatingActionButton(
      backgroundColor: Colors.red,
        child: Icon(Icons.add),
        onPressed: (){
      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text('title'),
            content: Form(
              key: formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: idController,
                      decoration: InputDecoration(labelText: "ID"),
                      validator: (v){
                        if(v!.isEmpty){
                          return "it is Empty";
                        }
                        else{
                          return null;
                        }
                      },

                    ),
                    TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(labelText: "Title"),
                      validator: (v){
                        if(v!.isEmpty){
                          return "it is Empty";
                        }
                        else{
                          return null;
                        }
                      },

                    ),
                    TextFormField(
                      controller: contentController,
                      decoration: InputDecoration(labelText: "content"),
                      validator: (v){
                        if(v!.isEmpty){
                          return "it is Empty";
                        }
                        else{
                          return null;
                        }
                      },

                    )
                  ],

                )),
            actions: <Widget>[
              TextButton(
                child: Text('cancle'),
                onPressed: () {
                  Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                },
              ),
              ElevatedButton(onPressed: (){
                if(formkey.currentState!.validate()){
                  todoList.add(AddToDO(id: idController.text,content: contentController.text,title: titleController.text));
                  Navigator.of(dialogContext).pop(); // Dismiss alert dialog

                }
              }, child: Text("add"))
            ],
          );
        },
      );
    });
  }
}
