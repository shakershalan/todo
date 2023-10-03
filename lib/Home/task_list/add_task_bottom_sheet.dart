import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/mytheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled4/Models/tasks.dart';
import '../../firebase_utils.dart';
import '../../providers/app_config_provider.dart';

class AddTaskBottomSheet extends StatefulWidget{


  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedDate=DateTime.now();
  var formKey=GlobalKey<FormState>();
  late ListProvider listProvider;
  String title="";
  String description = "";
  @override
  Widget build(BuildContext context) {
     listProvider = Provider.of<ListProvider>(context);
    return SingleChildScrollView(
      child: Container(
        color: listProvider.isDarK()?MyTheme.backgroundDark:MyTheme.backgroundLight,

        child: Form(
           key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text( AppLocalizations.of(context)!.add_task
                ,style:listProvider.isDarK()? Theme.of(context).textTheme.
                    titleMedium!.copyWith(color: MyTheme.whiteColor)
                        :Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.center),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (text) {
                    title=text;
                  },
                  validator: (text) => text!.isEmpty || text == null?AppLocalizations.of(context)!.enter_title:null ,
                  decoration: InputDecoration(
                    label: Text(AppLocalizations.of(context)!.enter_title,style: Theme.of(context).textTheme.
                    titleSmall?.copyWith(color: MyTheme.greyColor)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (text) {
                    description=text;
                  },
                  validator: (text) => text!.isEmpty || text == null?AppLocalizations.of(context)!.enter_desc:null ,
                  maxLines: 3,
                  decoration: InputDecoration(

                    label: Text(AppLocalizations.of(context)!.description,style:listProvider.isDarK()? Theme.of(context).textTheme.
                    titleSmall?.copyWith(color: MyTheme.whiteColor)
                        :Theme.of(context).textTheme.
                    titleSmall?.copyWith(color: MyTheme. greyColor),),

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(AppLocalizations.of(context)!.select_Task,style:listProvider.isDarK()?Theme.of(context).textTheme.
                titleSmall?.copyWith(color: MyTheme.whiteColor)
                    :Theme.of(context).textTheme.titleSmall),
              ),
              InkWell(
                onTap: (){
                  showCalendar();
                  setState(() {

                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                      style:listProvider.isDarK()? Theme.of(context).textTheme.
                      titleSmall?.copyWith(color: MyTheme.whiteColor):Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.center),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){
                  addTask();
                },
                  child:Text(AppLocalizations.of(context)!.add,style: Theme.of(context).textTheme.titleMedium
                      ?.copyWith(color: MyTheme.whiteColor),)
                ),
              )


            ],
          ),
        ),
      ),
    );
  }

  void showCalendar() async{
   var chosenDate =await showDatePicker(context: context,
        initialDate:DateTime.now() ,
        firstDate: DateTime.now().subtract(Duration(days: 365)),
        lastDate: DateTime.now().add(Duration(days: 365)));

   if(chosenDate != null){
     selectedDate=chosenDate;
   }

  }

  void addTask() {
    if(formKey.currentState?.validate()==true){
     Task task = Task(title: title,
         description: description,
         dateTime: selectedDate);
      FirebaseUtils.addTaskToFireStore(task).timeout(
        Duration(milliseconds: 500),
        onTimeout: () {
          print("todo added successfully");
          listProvider.getAllTasksFromFireStore();
          Navigator.pop(context);


        },
      );
    }
  }


}
