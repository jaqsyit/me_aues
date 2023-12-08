import 'package:flutter/material.dart';
import 'package:me_aues/features/info/total_screen.dart';
import '../../constants/styles.dart';

class MainBar extends StatefulWidget {
  const MainBar({super.key});

  @override
  State<MainBar> createState() => _MainBarState();
}

class _MainBarState extends State<MainBar> {
  int _selectedIndex = 0;

  final tabs = [
    const TotalScreen(),
    // const SkladScreen(),
    // const BankScreen(),
    // const ProfileScreen(),
    // const Placeholder(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: AppStyles.secondaryColor,
        backgroundColor: AppStyles.primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.group,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.warehouse,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.monetization_on ,
              size: 30,
            ),
            label: '',
          ),
          
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: '',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: tabs[_selectedIndex],
    );
  }
}