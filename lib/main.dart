import 'package:custom_numpad/core/theme/theme.dart';
import 'package:custom_numpad/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Custom numpad',
      debugShowCheckedModeBanner: false,
      theme: cupertino_dark,

      supportedLocales: [Locale('en'), Locale('fr')],
      home: HomeScreen(),
    );
  }
}
