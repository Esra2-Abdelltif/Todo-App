import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_graph_ql/bloc/todo_bloc.dart';
import 'package:todo_graph_ql/bloc/todo_events.dart';

class CardWidget extends StatelessWidget {
 final dynamic tode;
  const CardWidget({super.key,required this.tode});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context){
      final todoList=BlocProvider.of<ToDoBloc>(context);
      return Card(
        elevation: 2,
        child: ListTile(
          title: Text(tode['title']),
          subtitle: Text(tode['content']),
          leading:IconButton(onPressed: (){
            todoList.add(DeleteToDO(tode['id']));
          }, icon: Icon(Icons.delete)) ,
        ),
      );
    });
  }
}
