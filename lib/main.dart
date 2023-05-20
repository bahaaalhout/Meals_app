import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sixth_app/screens/tab_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 47, 20, 0),
      brightness: Brightness.dark,
    ),
    textTheme: GoogleFonts.latoTextTheme());
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme,
      home: const TabsScreen(),
    );
  }
}
