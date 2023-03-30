import 'package:flutter/material.dart';
import 'package:flutter_kakao/screens/chat_screen.dart';
import 'package:flutter_kakao/screens/friend_screen.dart';
import 'package:flutter_kakao/screens/more_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void changeScreen(index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          FriendScreen(),
          ChatScreen(),
          MoreScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black87,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.grey[200],
        onTap: (index){
          changeScreen(index);
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.user),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.comment),
              label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.ellipsisH),
              label: ""
          ),
        ],
      ),
    );
  }
}
