import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/firebase_utils.dart';

import '../../mytheme.dart';
import '../../providers/app_config_provider.dart';
import '../../Models/tasks.dart';

class TaskWidgetItem extends StatefulWidget {
  Task task;

  TaskWidgetItem({required this.task});

  @override
  State<TaskWidgetItem> createState() => _TaskWidgetItemState();
}

class _TaskWidgetItemState extends State<TaskWidgetItem> {
  late var provider;
  @override
  Widget build(BuildContext context) {
      provider = Provider.of<ListProvider>(context);
    return Container(
      margin: EdgeInsets.all(12),
      child: Slidable(
        startActionPane: ActionPane(
            extentRatio: .25,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                onPressed: (context) {
                  FirebaseUtils.deleteTaskFromFireStore(widget.task)
                      .timeout(Duration(milliseconds: 500), onTimeout: () {
                    print("task deleted");
                    provider.getAllTasksFromFireStore();
                  });
                },
                backgroundColor: MyTheme.redColor,
                foregroundColor: MyTheme.whiteColor,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ]),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: provider.isDarK() ? MyTheme.blockDark : MyTheme.whiteColor,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color:widget.task.isDone==true?
                    MyTheme.greenColor
                :MyTheme.primaryLight,
                width: 3,
                height: 80,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.task.title ?? "",
                        style:widget.task.isDone==true?
                        Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: MyTheme.greenColor)
                        :Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: MyTheme.primaryLight),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.task.description ?? "",
                          style: provider.isDarK()
                              ? Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: MyTheme.whiteColor)
                              : Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: MyTheme.greyColor)),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                   updateTask();
                   provider.getAllTasksFromFireStore();
                },
                child:widget.task.isDone==true?
                Container(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                    decoration: BoxDecoration(
                        color: MyTheme.whiteColor,
                        borderRadius: BorderRadius.circular(15)),
                    child:Text("Done!",style: Theme.of(context).textTheme.
                    titleMedium!.copyWith(color: MyTheme.greenColor),)
                    )
                    :Container(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                    decoration: BoxDecoration(
                        color: MyTheme.primaryLight,
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(
                      Icons.check,
                      color: MyTheme.whiteColor,
                      size: 35,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
  void updateTask() {


      FirebaseUtils.updateTaskFromFireStore(widget.task).timeout(
        Duration(milliseconds: 500),
        onTimeout: () {
          widget.task.isDone=true;
          print(widget.task.isDone);
          FirebaseUtils.getTasksCollection();



        },
      );

  }
}
