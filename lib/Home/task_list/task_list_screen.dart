import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/Home/task_list/task_widget_item.dart';
import 'package:untitled4/firebase_utils.dart';
import 'package:untitled4/mytheme.dart';
import 'package:untitled4/providers/app_config_provider.dart';
import 'package:untitled4/Models/tasks.dart';

class TaskList extends StatefulWidget {
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ListProvider>(context);
    if(provider.tasksList.isEmpty){
    provider.getAllTasksFromFireStore();
    }

    return Column(
      children: [
        CalendarTimeline(
          initialDate: provider.selectDate,
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date){
            provider.changeSelectDate(date);
          },
          leftMargin: 20,
          monthColor:provider.isDarK()?MyTheme.whiteColor:MyTheme.blackColor,
          dayColor: provider.isDarK()?MyTheme.whiteColor:MyTheme.blackColor,
          activeDayColor: provider.isDarK()?MyTheme.whiteColor:MyTheme.blackColor,
          activeBackgroundDayColor: MyTheme.primaryLight,
          dotsColor: provider.isDarK()?MyTheme.whiteColor:MyTheme.blackColor,
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
        Expanded(child: ListView.builder(
          itemBuilder: (context, index) => TaskWidgetItem(task:provider.tasksList[index] ,),
          itemCount:provider.tasksList.length,
        ))
      ],
    );

  }


}
