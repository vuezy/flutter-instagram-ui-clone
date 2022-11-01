import 'package:flutter/material.dart';
import '/screens/home_screen.dart';
import '/screens/search_screen.dart';
import '/screens/profile_screen.dart';
import '/widgets/my_icon_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentScreenIndex = 0;

  Widget _setScreen() {
    switch (_currentScreenIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const SearchScreen();
      case 2:
        return const ProfileScreen();
      default:
        return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Instagram UI Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: _setScreen(),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.grey, offset: Offset(0.0, -0.5)),
            ]
          ),
          child: BottomAppBar(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyIconButton(
                  icon: _currentScreenIndex == 0 ? Icons.home : Icons.home_outlined,
                  onPressed: () {
                    setState(() {
                      _currentScreenIndex = 0;
                    });
                  }
                ),
                MyIconButton(
                  icon: _currentScreenIndex == 1 ? Icons.manage_search : Icons.search_outlined,
                  onPressed: () {
                    setState(() {
                      _currentScreenIndex = 1;
                    });
                  }
                ),
                MyIconButton(
                  icon: Icons.video_library_outlined,
                  onPressed: () {}
                ),
                MyIconButton(
                  icon: Icons.local_mall_outlined,
                  onPressed: () {}
                ),
                MyIconButton(
                  icon: _currentScreenIndex == 2 ? Icons.account_circle : Icons.account_circle_outlined,
                  onPressed: () {
                    setState(() {
                      _currentScreenIndex = 2;
                    });
                  }
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}