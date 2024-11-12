import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_graph_ql/bloc/todo_events.dart';
import 'package:todo_graph_ql/bloc/todo_states.dart';
import 'package:todo_graph_ql/data/repository.dart';

class ToDoBloc extends Bloc<TodoEvent,TodoStates>{
  final TodoRepo todoRepo;
  ToDoBloc(this.todoRepo):super(ToDoLoadingStates()){
    on<FatchToDo>((event,emit)async{
      emit(ToDoLoadingStates());
      try {
        final todos=await todoRepo.fetchData();
        emit(ToDoLoadedStates(todos));
      }catch(e){
        emit(ToDoErrorStates(e.toString()));
      }
      

    });

    on<AddToDO>((event,emit)async{
      emit(ToDoLoadingStates());
      try {
       await todoRepo.addTodo(id: event.id,title: event.title,content: event.content);
       add(FatchToDo());
      }catch(e){
        emit(ToDoErrorStates(e.toString()));
      }


    });

    on<DeleteToDO>((event,emit)async{
      emit(ToDoLoadingStates());
      try {
        await todoRepo.deleteTodo(id: event.id,);
        add(FatchToDo());
      }catch(e){
        emit(ToDoErrorStates(e.toString()));
      }


    });

    
  }


}