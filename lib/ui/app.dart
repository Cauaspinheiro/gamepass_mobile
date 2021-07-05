import 'package:flutter/material.dart';
import 'package:gamepass/ui/theme/colors.dart';

import 'home/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xbox Game Pass',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ThemeColors.background,
        primarySwatch: Colors.grey,
      ),
      home: HomePage(),
    );
  }
}
