import 'package:flutter/material.dart';
import 'package:gamepass_clone/ui/home/widgets/home_app_bar_widget.dart';
import 'package:gamepass_clone/ui/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ThemeColors.primary,
            ThemeColors.background,
          ],
          begin: Alignment.topCenter,
          end: Alignment(0, -.5),
        ),
      ),
      child: Scaffold(
        body: Container(),
        backgroundColor: Colors.transparent,
        appBar: HomeAppBarWidget(),
      ),
    );
  }
}
