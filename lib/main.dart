import 'package:flutter/material.dart';
import 'package:newnotesapp/modals/notedtb.dart';
import 'package:newnotesapp/pages/notes_pages.dart';
import 'package:newnotesapp/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NoteDtb.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => NoteDtb()),
      ChangeNotifierProvider(create: (context) => ThemeProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
