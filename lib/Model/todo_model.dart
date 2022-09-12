class TodoEntities {
  final String id , name , body;

  const TodoEntities({required this.id,required this.name,required this.body});

}

class TodoModel extends TodoEntities {
  const TodoModel({required super.id, required super.name, required super.body});

  factory TodoModel.fromJson( Map<String,dynamic>json ) {
    return TodoModel(
        id: json['_id'] ,
        name: json['name'] ,
        body: json['body']);
  }
}