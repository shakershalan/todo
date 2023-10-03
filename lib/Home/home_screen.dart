import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/Home/settings/Setting.dart';
import 'package:untitled4/Home/task_list/add_task_bottom_sheet.dart';
import 'package:untitled4/Home/task_list/task_list_screen.dart';
import 'package:untitled4/mytheme.dart';
import 'package:untitled4/providers/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName="home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    int selectedIndex= 0;
    List<Widget>taps=[TaskList(),Setting()];

  @override
  Widget build(BuildContext context) {
var provider = Provider.of<ListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.todo,style:provider.isDarK()? Theme.of(context).textTheme.
        titleLarge!.copyWith(color: MyTheme.blackColor)
            :Theme.of(context).textTheme.titleLarge,),


      ),
      bottomNavigationBar: BottomAppBar(
        color: provider.isDarK() ? MyTheme.blockDark : MyTheme.whiteColor,
        shape: CircularNotchedRectangle(
        ),
        notchMargin: 8,
        child: BottomNavigationBar(

          currentIndex: selectedIndex ,
          onTap: (index) {
            selectedIndex = index;
            setState(() {

            });

          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: AppLocalizations.of(context)!.list,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: AppLocalizations.of(context)!.settings,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showTaskBottomSheetItem();
      },
        child: Icon(Icons.add),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: taps[selectedIndex],
    );
  }

  void showTaskBottomSheetItem() {
    showModalBottomSheet(context: context, builder: (context) => AddTaskBottomSheet(),);
  }


}


