import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key, required this.radius, required this.image});

  final double radius;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: (radius + 4.5) * 2.0,
          height: (radius + 4.5) * 2.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius + 4.5),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color.fromARGB(255, 237, 144, 3), Color.fromARGB(255, 217, 24, 50), Color.fromARGB(255, 165, 36, 216)]
            )
          )
        ),
        Container(
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius + 2.0),
            color: Colors.white,
          ),
          child: CircleAvatar(
            radius: radius,
            backgroundImage: AssetImage(image)
          ),
        ),
      ]
    );
  }
}