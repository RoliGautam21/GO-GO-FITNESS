import 'package:flutter/material.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  List<Widget> listScreen = [];
  int index = 0;
  onTap(int ontapind) {
    setState(() {
      index = ontapind;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: listScreen[index],
      bottomNavigationBar:     BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_sharp), label: 'Favourite'),
        ],
        showSelectedLabels: false,
        selectedIconTheme: IconThemeData(
          color: Colors.purple,
        ),
        onTap: onTap,
      ),
    )
    ;
  }
}