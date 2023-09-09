import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/screens/home.dart';

import 'projects/projects.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _bottomNavIndex = 0;
  final iconList = <IconData>[
    Icons.home_rounded,
    Icons.insert_drive_file_rounded,
    Icons.mail_rounded,
    Icons.settings_rounded,
  ];
  List<Widget> screens = [
    const HomePage(),
    const ProjectsPage(),
    const Center(child: Text('Messages Screen')),
    const Center(child: Text('Settings Screen')),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: screens[_bottomNavIndex], //destination screen
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurpleAccent.shade100,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50.0))),
          onPressed: () {},
          //params
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: iconList,
          inactiveColor: Colors.grey,
          activeColor: Colors.deepPurpleAccent.shade100,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          leftCornerRadius: 22,
          rightCornerRadius: 22,
          onTap: (index) => setState(() => _bottomNavIndex = index),
          //other params
        ),
      ),
    );
  }
}
