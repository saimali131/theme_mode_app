// import 'package:flutter/material.dart';
// import 'screens/new_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   ThemeMode mode = ThemeMode.light;

//   void toggleTheme() {
//     setState(() {
//
//       mode = mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       themeMode: mode,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
//         brightness: Brightness.light,
//       ),
//       darkTheme: ThemeData(brightness: Brightness.dark),

//       home: ProfileChangeScreen(mode: mode, x: toggleTheme),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:theme_mode_app/screens/thmeme-mode.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  ThemeMode mode = ThemeMode.light;
  void toggle() {
    setState(() {
      mode = mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      themeMode: mode,
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: ProfileScreen(mode: mode, x: toggle),
    );
  }
}
