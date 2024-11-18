import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Multi-Theme and Multi-Font App',
      theme: themeProvider.currentTheme,
      home: MainScreen(),
    );
  }
}
