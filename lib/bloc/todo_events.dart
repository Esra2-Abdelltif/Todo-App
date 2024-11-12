abstract class TodoEvent{}
class FatchToDo extends TodoEvent{}
class AddToDO extends TodoEvent{
  final String id,title,content;
  AddToDO({required this.id, required this.title,required this.content});
}
class DeleteToDO extends TodoEvent{
  final String id;
  DeleteToDO(this.id,);
}