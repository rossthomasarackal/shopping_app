import 'package:deros/decoration.dart';
import 'package:deros/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    final prefs=  await SharedPreferences.getInstance();
    await Future.delayed(const Duration(milliseconds: 2000), () {
      if(prefs.getBool('flag')??false) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
      else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Decor(),
          ),
        );
      }
    },
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(190, 250, 250, 250),
              Color.fromARGB(255, 89, 199, 199),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/comp.png',
                width: 600,
              ),
              const Text(
                'E_TroniX',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(250, 55, 58, 208),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
