import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/mytheme.dart';
import 'package:untitled4/providers/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShowThemeItem extends StatefulWidget {

  @override
  State<ShowThemeItem> createState() => _ShowThemeItemState();
}

class _ShowThemeItemState extends State<ShowThemeItem> {
  @override
  Widget build(BuildContext context) {

   var provider =Provider.of<ListProvider>(context);
    return Container(
      color: provider.isDarK()?MyTheme.backgroundDark:MyTheme.backgroundLight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              provider.changeTheme(ThemeMode.light);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: provider.appTheme == ThemeMode.light?
                  getSelectedItem(AppLocalizations.of(context)!.light)
                  :getUnSelectedItem(AppLocalizations.of(context)!.light),
            ),
          ),
          InkWell(
            onTap: (){
              provider.changeTheme(ThemeMode.dark);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:provider.isDarK()?
                  getSelectedItem(AppLocalizations.of(context)!.dark)
                  :getUnSelectedItem(AppLocalizations.of(context)!.dark)
            ),
          ),
        ],
      )
    );
  }

  Widget getSelectedItem(String text){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: Theme.of(context).
        textTheme.titleSmall!.copyWith(color: MyTheme.primaryLight),),
        Icon(Icons.check,color: MyTheme.primaryLight,)
      ],
    );
  }
  Widget getUnSelectedItem(String text){
    return Text(text,
      style: Theme.of(context).
    textTheme.titleSmall,);
  }
}
