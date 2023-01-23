import 'package:flutter/material.dart';

class AppBox extends StatelessWidget {
  const AppBox({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
