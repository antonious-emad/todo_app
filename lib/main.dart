import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:third/layout/home_layout.dart';
import 'package:third/providers/provider.dart';
import 'package:third/screens/edit_task_tab/edit_task_tab.dart';
import 'package:third/screens/login/login.dart';
import 'package:third/shared/styles/theming.dart';
import 'firebase_options.dart';
void main() async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
// FirebaseFirestore.instance.disableNetwork();
runApp(ChangeNotifierProvider(
      create: (context) => MyProider(),
      child: MyApp()));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProider>(context);
    return MaterialApp(
      routes: {
        HomeLayout.routeName:(context) => HomeLayout(),
        EditTaskScreen.routeName:(context) => EditTaskScreen(),
        Login.routeName:(context) => Login(),
      },
      initialRoute:provider.firbaseUser!=null?HomeLayout.routeName :Login.routeName,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      theme: Theming.lightTheme,
      darkTheme: Theming.darkTheme,
      themeMode: provider.isDark?ThemeMode.dark:ThemeMode.light,
      locale: Locale(provider.languageCode),
    );
  }
}

