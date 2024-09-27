import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_and_series_app/features/genres/view/genres_page.dart';
import 'package:movies_and_series_app/features/home/view/home_page.dart';
import 'package:movies_and_series_app/features/lists/view/lists_page.dart';
import 'package:movies_and_series_app/features/profile/view/profile_page.dart';
import 'package:movies_and_series_app/core/general_widgets/custom_appbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static final List<Widget> _screens = <Widget>[
    const HomePage(),
    const GenresPage(),
    ListsPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: CustomAppbar()),
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
            elevation: 0,
            currentIndex: _selectedIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.house), label: "Anasayfa"),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.shapes), label: "Türler"),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.list), label: "Listeler"),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.user), label: "Profil"),
            ],
          ),
          body: Center(
            child: _screens.elementAt(_selectedIndex),
          )),
    );
  }
}
