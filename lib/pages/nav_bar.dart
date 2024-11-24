import 'package:convert_zone/pages/home_screen.dart';
import 'package:convert_zone/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../styles/consts.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {


  int _selectedIndex = 0;
  DateTime preBackPress = DateTime.now();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = [
      HomeScreen(),
      SettingsPage(),
    ];

    return WillPopScope(
      onWillPop: () async {
        final timeGap = DateTime.now().difference(preBackPress);
        final canExit = timeGap < const Duration(seconds: 2);
        preBackPress = DateTime.now();

        if (!canExit) {
          Fluttertoast.showToast(
            msg: 'Press again to exit the app',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: fallbackColorTheme,
        body: Center(
          child: widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white, // Transparent to show gradient
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.amber,
          elevation: 0,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: IconThemeData(size: 30),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,
                  color: _selectedIndex == 0 ? Colors.amber : Colors.grey),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings,
                  color: _selectedIndex == 1 ? Colors.amber : Colors.grey),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped, // Use the refactored function
        ),
      ),
    );
  }
}
