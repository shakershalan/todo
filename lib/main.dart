import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/Home/home_screen.dart';
import 'package:untitled4/auth/login/login_screen.dart';
import 'package:untitled4/auth/register/register_screen.dart';

import 'package:untitled4/mytheme.dart';
import 'package:untitled4/providers/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();
  FirebaseFirestore.instance.settings =
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  runApp(ChangeNotifierProvider(
    create: (context) => ListProvider(),
      child: MyApp()));
}
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
   var provider = Provider.of<ListProvider>(context);
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      theme: MyTheme.themeLight,
      darkTheme: MyTheme.themeDark,
      themeMode:provider.appTheme ,
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routes: {
        HomeScreen.routeName:(context) => HomeScreen(),
        LoginScreen.routeName:(context) => LoginScreen(),
        RegisterScreen.routeName:(context) => RegisterScreen()

      },
    );
  }
}
