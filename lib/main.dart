import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_isar/models/note_database.dart';
import 'package:todo_isar/theme/theme_provider.dart';
import 'pages/notes_page.dart';

void main() async {
  // initialize note isar database
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();
  runApp(
    MultiProvider(
      providers: [
        // note provider
        ChangeNotifierProvider(
          create: (context) => NoteDatabase(),
        ),
        // theme provider
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO Isar',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: NotesPage(),
    );
  }
}
