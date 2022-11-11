import 'package:flutter/material.dart';
import 'package:starbucks_clone/model.dart';
import 'package:starbucks_clone/starbucks_secondpage.dart';
import 'starbucks_firstpage.dart';
import 'starbucks_thirdpage.dart';

void main() {
  runApp(MaterialApp(
    home: Starbucks(),
  ));
}

class Starbucks extends StatefulWidget {
  const Starbucks({super.key});

  @override
  State<Starbucks> createState() => _StarbucksState();
}

class _StarbucksState extends State<Starbucks> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          StarbucksFirstPage(),
          StarbucksSecondPage(),
          StarbucksThirdPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: StarbucksColor().starbucksPrimaryColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card_rounded), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.free_breakfast), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.redeem), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: ""),
        ],
      ),
    );
  }
}
