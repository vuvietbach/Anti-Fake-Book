import 'package:anti_fake_book/styles.dart';
import 'package:flutter/material.dart';

class PrimaryNavButton extends StatelessWidget {
  final Widget nextPage;
  final String text;
  const PrimaryNavButton({super.key, required this.nextPage, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => nextPage));
        },
        style: CustomButtonStyle.roundBorderButton(30.0),
        child: Text(text),
      ),
    );
  }
}

class SecondaryNavButton extends StatelessWidget {
  final Widget nextPage;
  final String text;
  const SecondaryNavButton({super.key, required this.nextPage, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => nextPage));
        },
        style: CustomButtonStyle.roundBorderButton(30.0),
        child: Text(text),
      ),
    );
  }
}