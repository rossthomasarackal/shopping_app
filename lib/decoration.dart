import 'package:deros/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _usernameController = TextEditingController();
final _passwordController = TextEditingController();

class Decor extends StatelessWidget {
  const Decor({super.key});
  @override
  Widget build(context) {
    return Scaffold(
        body: SingleChildScrollView(
          child : Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
            Color.fromARGB(255, 182, 170, 210),
            Color.fromARGB(255, 73, 134, 183),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/deroslogin.png'),
          SizedBox(
            width: 500, height: 60,
            child: TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'User Name'),
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: 500, height: 60,
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
            height: 45, width: 150,
            child: ElevatedButton.icon(
              onPressed: () {
                CheckLogin(context);
              },
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Login'),
            ),
          ),
        ],
      ),
    ),
        ));
  }
}

void CheckLogin (BuildContext ctx) async {

  final _username = _usernameController.text;
  final _password = _passwordController.text;
  String abc= 'abc';
  final password=  _username+abc;
  if (_username.isEmpty) {
    const _errorMessage = 'Username and Password not matching';
    ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
      content: Text(_errorMessage),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(10),
      backgroundColor: Colors.lightBlueAccent,
      duration: Duration(seconds: 5),
    ));
  } else  if (_password.isEmpty) {
    const _errorMessage = 'Username and Password not matching';
    ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
      content: Text(_errorMessage),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(10),
      backgroundColor: Colors.lightBlueAccent,
      duration: Duration(seconds: 5),
    ));
  }else{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('flag', true);
    Navigator.of(ctx).pushReplacement(MaterialPageRoute (builder: (ctx1) =>const  HomeScreen(),),);
  }
}
