import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/mytheme.dart';
import 'package:untitled4/providers/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShowLanguageItem extends StatefulWidget {

  @override
  State<ShowLanguageItem> createState() => _ShowLanguageItemState();
}

class _ShowLanguageItemState extends State<ShowLanguageItem> {
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
                provider.changeLanguage("en");
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: provider.appLanguage=='en'?
                getSelectedItem(AppLocalizations.of(context)!.english)
                    :getUnSelectedItem(AppLocalizations.of(context)!.english),
              ),
            ),
            InkWell(
              onTap: (){
                provider.changeLanguage("ar");
              },
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:provider.appLanguage=="ar"?
                  getSelectedItem(AppLocalizations.of(context)!.arabic)
                      :getUnSelectedItem(AppLocalizations.of(context)!.arabic)
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
