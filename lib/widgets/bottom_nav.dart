import 'package:adventure_nepal/pages/home_page/home_page.dart';
import 'package:adventure_nepal/pages/maps_page/maps_page.dart';
import 'package:adventure_nepal/pages/videos_page/videos_page.dart';
import 'package:flutter/material.dart';
import 'package:adventure_nepal/pages/settings_page/settings_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  static final List<Widget> _navList = <Widget>[
    const HomePage(),
    // const MapsPage(),
    const VideosPage(),
    const SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _navList.elementAt(_currentIndex)),
      bottomNavigationBar: GNav(
        gap: 10,
        color: Colors.white,
        backgroundColor: const Color.fromARGB(255, 92, 225, 230),
        hoverColor: Colors.grey,
        selectedIndex: _currentIndex,
        tabBackgroundColor: Colors.grey.shade600,
        tabBorderRadius: 100,
        activeColor: Colors.white,
        padding: const EdgeInsets.all(10),
        tabMargin: const EdgeInsets.all(10),
        onTabChange: (newIndex) => {
          setState(() {
            _currentIndex = newIndex;
          })
        },
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          // GButton(
          //   icon: Icons.map,
          //   text: 'Map',
          // ),
          GButton(
            icon: Icons.video_collection_sharp,
            text: 'Videos',
          ),
          GButton(
            icon: Icons.settings,
            text: 'Settings',
          ),
        ],
      ),
    );
  }
}
