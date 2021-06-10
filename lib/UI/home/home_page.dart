import 'package:flutter/material.dart';
import 'package:gamepass_clone/UI/shared/widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        iconName: Icons.search,
        onIconPressed: () {},
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.0, -0.95),
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff131313),
              Colors.greenAccent.shade400,
            ],
          ),
        ),
        child: Center(
          child: Text(
            'Xbox Gamepass',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
