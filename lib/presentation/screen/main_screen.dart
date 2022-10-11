import 'package:dcit24/core/theme/theme_color.dart';
import 'package:dcit24/presentation/screen/add_data_screen.dart';
import 'package:dcit24/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List screen = [const HomeScreen(), const AddDataScreen()];
  int currentIndex = 0;
  void onChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screen[currentIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: darkRed,
          ),
          child: BottomNavigationBar(
            selectedItemColor: WHITE,
            selectedFontSize: 12,
            unselectedItemColor: Colors.grey.shade400,
            onTap: onChanged,
            currentIndex: currentIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
            ],
          ),
        ));
  }
}
