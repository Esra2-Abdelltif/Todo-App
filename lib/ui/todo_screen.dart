import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_graph_ql/bloc/todo_bloc.dart';
import 'package:todo_graph_ql/bloc/todo_states.dart';
import 'package:todo_graph_ql/ui/widget/add_todo_widget.dart';
import 'package:todo_graph_ql/ui/widget/cart_widget.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddToDoWidget(),
        body: BlocConsumer<ToDoBloc, TodoStates>(
      listener: (context, state) {
        if (state is ToDoErrorStates) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.msg)));
        }
      },
      builder: (context, state) {
         if (state is ToDoLoadingStates) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if   (state is ToDoLoadedStates) {
          return ListView.builder(
              itemCount: state.todo.length,
              itemBuilder: (context,index){
                return CardWidget(tode:state.todo[index]);
              });
        }
        else{
          return Center();
         }
      },
    )
    );
  }
}
