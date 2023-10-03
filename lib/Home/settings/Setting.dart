import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/Home/settings/show_languges_item.dart';
import 'package:untitled4/Home/settings/show_theme_item.dart';
import 'package:untitled4/mytheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled4/providers/app_config_provider.dart';

class Setting extends StatefulWidget {


  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ListProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(AppLocalizations.of(context)!.theming,style:provider.isDarK()? Theme.of(context).textTheme
              .titleMedium!.copyWith(color: MyTheme.whiteColor)
          :Theme.of(context).textTheme.titleMedium
          ),
        ),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
           padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
           margin: EdgeInsets.all(8),
           color: MyTheme.whiteColor,
           child: InkWell(
             onTap: () {
               showThemeBottomSheet();
             },
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(provider.isDarK()?AppLocalizations.of(context)!.dark:
                 AppLocalizations.of(context)!.light,style:provider.isDarK()?Theme.of(context).textTheme.
                 titleSmall!.copyWith(color: MyTheme.primaryLight)
                     :Theme.of(context).textTheme.titleSmall),
                 Icon(Icons.arrow_drop_down,color:provider.isDarK()?MyTheme.primaryLight: MyTheme.blackColor,)
               ],
             ),
           ),
         ),
       ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(AppLocalizations.of(context)!.language,style:provider.isDarK()? Theme.of(context).textTheme
              .titleMedium!.copyWith(color: MyTheme.whiteColor)
              :Theme.of(context).textTheme.titleMedium
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            margin: EdgeInsets.all(8),
            color: MyTheme.whiteColor,
            child: InkWell(
              onTap: () {
                showLanguageBottomSheet();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.isDarK()?AppLocalizations.of(context)!.english
                      :AppLocalizations.of(context)!.arabic,style:provider.isDarK()?Theme.of(context).textTheme.
                  titleSmall!.copyWith(color: MyTheme.primaryLight)
                      :Theme.of(context).textTheme.titleSmall),
                  Icon(Icons.arrow_drop_down,color:provider.isDarK()?MyTheme.primaryLight: MyTheme.blackColor,)
                ],
              ),
            ),
          ),
        ),



      ],
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(context: context, builder:(context) {
      return ShowThemeItem() ;
    },);
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(context: context, builder: (context) =>ShowLanguageItem());
  }
}
