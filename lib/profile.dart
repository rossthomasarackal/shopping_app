import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(126, 227, 14, 103),
      body: Column(
        children: [
          Center(
            child: Text(
              'Profile',
              style: TextStyle(
                  color: Color.fromARGB(255, 197, 194, 124),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
