import 'package:flutter/material.dart';

class NotificationContent extends StatelessWidget {
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

class Notification extends StatelessWidget {
  const Notification({Key? key});

  @override
  Widget build(BuildContext context) {
    return NotificationContent();
  }
}
