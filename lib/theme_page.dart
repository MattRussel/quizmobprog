import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light();
  String _currentFont = 'Arial';
  String _currentThemeString = 'light';

  ThemeData get currentTheme => _currentTheme;
  String get currentFont => _currentFont;

  void setTheme(String theme) {
    String selectedFont = _currentFont;

    switch (theme) {
      case 'white':
        _currentTheme = ThemeData.light();
        break;
      case 'black':
        _currentTheme = ThemeData.dark();
        break;
      case 'purple':
        _currentTheme = ThemeData(
          primarySwatch: Colors.purple,
          scaffoldBackgroundColor: Colors.purple.shade50,
          appBarTheme: AppBarTheme(color: Colors.purple.shade700),
        );
        break;
      default:
        _currentTheme = ThemeData.light();
    }

    _currentTheme = _currentTheme.copyWith(
      textTheme: _currentTheme.textTheme.apply(fontFamily: selectedFont),
    );

    _currentThemeString = theme;
    notifyListeners();
  }

  void setFont(String font) {
    _currentFont = font;
    _currentTheme = _currentTheme.copyWith(
      textTheme: _currentTheme.textTheme.apply(fontFamily: _currentFont),
    );
    notifyListeners();
  }

  String get currentThemeString => _currentThemeString;
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello, this is the Main Screen!',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
              child: Text('Go to Settings'),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Theme:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            ListTile(
              title: const Text('White Theme'),
              leading: Radio<String>(
                value: 'white',
                groupValue: themeProvider.currentThemeString,
                onChanged: (value) {
                  if (value != null) {
                    themeProvider.setTheme(value);
                  }
                },
              ),
            ),
            ListTile(
              title: const Text('Black Theme'),
              leading: Radio<String>(
                value: 'black',
                groupValue: themeProvider.currentThemeString,
                onChanged: (value) {
                  if (value != null) {
                    themeProvider.setTheme(value);
                  }
                },
              ),
            ),
            ListTile(
              title: const Text('Purple Theme'),
              leading: Radio<String>(
                value: 'purple',
                groupValue: themeProvider.currentThemeString,
                onChanged: (value) {
                  if (value != null) {
                    themeProvider.setTheme(value);
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Choose Font:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            ListTile(
              title: const Text('Arial'),
              leading: Radio<String>(
                value: 'Arial',
                groupValue: themeProvider.currentFont,
                onChanged: (value) {
                  if (value != null) {
                    themeProvider.setFont(value);
                  }
                },
              ),
            ),
            ListTile(
              title: const Text('Courier New'),
              leading: Radio<String>(
                value: 'Courier New',
                groupValue: themeProvider.currentFont,
                onChanged: (value) {
                  if (value != null) {
                    themeProvider.setFont(value);
                  }
                },
              ),
            ),
            ListTile(
              title: const Text('Times New Roman'),
              leading: Radio<String>(
                value: 'Times New Roman',
                groupValue: themeProvider.currentFont,
                onChanged: (value) {
                  if (value != null) {
                    themeProvider.setFont(value);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
