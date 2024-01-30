import 'package:deros/horizontal_list.dart';
import 'package:deros/profile.dart';
import 'package:flutter/material.dart';
import 'package:deros/decoration.dart';
import 'package:deros/grid.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text(
                'Deros',
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: const Text(
                'Deros@gmail.com',
                style: TextStyle(color: Colors.white),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: const Color.fromARGB(126, 227, 14, 103),
                child: Image.asset('assets/images/girl.png'),
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(126, 227, 14, 103),
              ),
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const Profile(),
                  ),
                );
              },
            ),
            ListTile(title: const Text('Settings'), onTap: () {}),
            ListTile(
                title: const Text('Logout'),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => const Decor(),
                    ),
                  );
                }),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(
            71, 199, 37, 59), //48, 40, 82, 253,48, 236, 32, 32,
        toolbarHeight: 90,
        //leading: IconButton(
        // color: Colors.black,
        // onPressed: () {},
        // icon: const Icon(Icons.menu),

        title: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: Colors.black),
            ),
            hintText: 'Search',
          ),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {
              signOut(context);
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: HorizontalList()),
                Grid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

signOut(BuildContext ctx) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('flag', false);
  Navigator.of(ctx).pushReplacement(
    MaterialPageRoute(
      builder: (ctx1) => const Decor(),
    ),
  );
}
