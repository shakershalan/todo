import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled4/Models/tasks.dart';

class FirebaseUtils{
  static CollectionReference<Task> getTasksCollection(){
    return  FirebaseFirestore.instance.collection(Task.collectionName).
    withConverter<Task>(
      fromFirestore: (snapshot, options) => Task.fromFireStore(snapshot.data()!),
      toFirestore: (value, options) => value.toFireStore(),
    );

  }
 static Future<void> addTaskToFireStore(Task task){
  var taskCollection = getTasksCollection();
  DocumentReference<Task>docRef = taskCollection.doc();
  task.id=docRef.id;
  return docRef.set(task);
}
static Future<void>deleteTaskFromFireStore(Task task){
    return getTasksCollection().doc(task.id).delete();

}
  static Future<void>updateTaskFromFireStore(Task task){
    return getTasksCollection().doc(task.id).update({"isDone":true});

  }
}