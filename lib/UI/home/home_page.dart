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
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.0, -0.70),
            radius: 1,
            focal: Alignment.topCenter,
            colors: [
              Color(0xff018647),
              Color(0xff131313),
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
