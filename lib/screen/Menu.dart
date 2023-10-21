import 'package:flutter/material.dart';

class MenuContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: 200,
          color: Colors.deepPurple,
        ),
        Container(
          height: 200,
          width: 200,
          color: Colors.deepPurple[400],
        ),
        Container(
          height: 200,
          width: 200,
          color: Colors.deepPurple[800],
        ),
      ],
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({Key? key});

  @override
  Widget build(BuildContext context) {
    return MenuContent();
  }
}
