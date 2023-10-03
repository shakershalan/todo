import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../firebase_utils.dart';
import '../Models/tasks.dart';

class ListProvider extends ChangeNotifier{
  ThemeMode appTheme = ThemeMode.light;
  String appLanguage = "en";
  List<Task> tasksList = [];
  DateTime selectDate=DateTime.now();
  void changeTheme(ThemeMode newTheme){
    if(appTheme==newTheme){
      return;
    }
    appTheme= newTheme;
    notifyListeners();


  }
  void changeLanguage(String newLanguage){
    if(appLanguage==newLanguage){
      return;
    }
    appLanguage= newLanguage;
    notifyListeners();


  }
  bool isDarK(){
    return appTheme == ThemeMode.dark;
  }
  void getAllTasksFromFireStore() async{
    QuerySnapshot<Task>querySnapshot= await FirebaseUtils.getTasksCollection().get();
    tasksList= querySnapshot.docs.map((doc){
      return doc.data();

    }).toList();

      tasksList=tasksList.where((task){
      if(
       task.dateTime?.day == selectDate.day &&
       task.dateTime?.month == selectDate.month &&
       task.dateTime?.year == selectDate.year
      ){
        return true;
      }
      return false;

    }).toList();
      tasksList.sort((Task task1,Task task2){
       return task1.dateTime!.compareTo(task2.dateTime!);

      });

    notifyListeners();
  }

  void changeSelectDate(DateTime newDate){
    selectDate = newDate;
    getAllTasksFromFireStore();
    notifyListeners();
  }


}