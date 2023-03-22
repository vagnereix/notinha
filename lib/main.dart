import 'package:flutter/material.dart';
import 'package:notinha_do_role/repositories/notes_repository.dart';
import 'package:notinha_do_role/shared/color_schemes.g.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesRepository(),
      builder: (context, child) => MaterialApp(
        title: 'Notinha do rolê',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          appBarTheme: const AppBarTheme(
            color: Colors.transparent,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
