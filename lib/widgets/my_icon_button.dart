import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 25.0,
      icon: Icon(icon, color: Colors.black, size: 30.0),
      onPressed: () => onPressed()
    );
  }
}