abstract class TodoEvent{}
class FatchToDo extends TodoEvent{}
class AddToDO extends TodoEvent{
  final String id,title,content;
  AddToDO(this.id,this.title,this.content);
}
class DeleteToDO extends TodoEvent{
  final String id;
  DeleteToDO(this.id,);
}