import 'dart:convert';

import 'package:http/http.dart' as http;


class TodoRepo {
  final graphQlBase = "http://192.168.1.10:2000/graphql";
  fetchData() async {
    final request = {
      'query': '''
         query{
           todos{
            id title content
           }
        }
      '''
    };

    var url = Uri.parse(graphQlBase);
    var headers={
      'content-Type':'application/json'

    };
    var response = await http.post(url, body: jsonEncode(request) ,headers: headers);
    if(response.statusCode ==200){
      var result =jsonDecode(response.body);
      final todos=result["data"]["todos"];
      return todos;
    }
  }

  addTodo({required String id, title, content})async{
    final request = {
      'query': '''
         mutation AddTodo(\$id:String,\$title:String,\$content:String,){
         addTodo(id:\$id,title:\$title,content:\$content,){
         id,title,content
         }
         }
      ''',
      'variables':{
        'id':id,
        'title':title,
        'content':content
    }
    };
    var url = Uri.parse(graphQlBase);
    var headers={
      'content-Type':'application/json'

    };
    var response = await http.post(url, body: jsonEncode(request) ,headers: headers);
    if(response.statusCode ==200){
      var result =jsonDecode(response.body);
      final todos=result["data"]["todos"];
      print("Insert Successfully");
      return todos;
    }else{
      print(response.statusCode);
    }


  }
  deleteTodo({required String id, })async{
    final request = {
      'query': '''
         mutation deleteTodo(\$id:String,){
         deleteTodo(id:\$id,){
         id,
         }
         }
      ''',
      'variables':{
        'id':id,

      }
    };
    var url = Uri.parse(graphQlBase);
    var headers={
      'content-Type':'application/json'

    };
    var response = await http.post(url, body: jsonEncode(request) ,headers: headers);
    if(response.statusCode ==200){
      print("Deleted Successfully");
    }else{
      print(response.statusCode);
    }


  }

}
