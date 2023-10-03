class Task{
  static const String collectionName="tasks";
  String? title;
  String? id;
  String? description;
  DateTime? dateTime;
  bool? isDone;
  Task({
    required this.title,
    required this.description,
    required this.dateTime,
     this.id="",
    this.isDone = false,

});
  Map<String,dynamic>toFireStore(){
    return {
      "id" : id,
     "title" : title,
   "description" : description,
    "dateTime" : dateTime?.millisecondsSinceEpoch,
    "isDone" : isDone,

  };}
  Task.fromFireStore(
      Map<String,dynamic> data):this(
    id: data['id'],
    title: data['title'],
    description: data['description'],
    isDone: data["isDone"],
    dateTime: DateTime.fromMillisecondsSinceEpoch(data['dateTime'])

  );




}