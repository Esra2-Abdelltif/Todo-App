abstract class TodoStates{}
class ToDoLoadingStates extends TodoStates{}
class ToDoLoadedStates extends TodoStates{
  List<dynamic> todo;
  ToDoLoadedStates(this.todo);
}
class ToDoErrorStates extends TodoStates{
  final String msg;
  ToDoErrorStates(this.msg);
}
