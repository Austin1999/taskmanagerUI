import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Home Page Card Widget

class HomeCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  const HomeCard({
    required this.color,
    required this.text,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Fluttertoast.showToast(
            msg: "You Pressed $text",
            toastLength: Toast.LENGTH_SHORT,
            fontSize: 16.0);
      },
      child: Stack(
        children: [
          Card(
            color: color,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    text,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Image.asset(
            'assets/images/cardoverlay.png',
            opacity: const AlwaysStoppedAnimation(0.3),
          )
        ],
      ),
    );
  }
}
