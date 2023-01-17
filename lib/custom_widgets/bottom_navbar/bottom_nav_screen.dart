import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../localization/localization_value.dart';
import '../../utils/globalcolors.dart';
import '../../views/home/home.dart';
import '../../views/profile/profile.dart';
import 'nav_drawer.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _page = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    // ProfileScreen(),
    const ProfileScreen(),
    const HomeScreen()
  ];

  final List<Widget> _icons = const <Widget>[
    BottomNavIcon(icon: Icons.home),
    BottomNavIcon(icon: Icons.person_outline),
    BottomNavIcon(icon: Icons.settings),
  ];

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    context.watch<LocalizationProvider>().currentLang;
    print("Bottom nav rebuilding");
    return Scaffold(
      extendBody: true,
      key: _drawerKey,
      drawer: NavigationDrawerScreen(),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0.h,
        items: _icons,
        color: appPrimaryCol,
        buttonBackgroundColor: appSecondaryCol,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.decelerate,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          index == 2
              ? _drawerKey.currentState?.openDrawer()
              : setState(() {
                  _page = index;
                });
        },
        letIndexChange: (index) => true,
      ),
      body: _screens[_page],
    );
  }
}

class BottomNavIcon extends StatelessWidget {
  final IconData icon;

  const BottomNavIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: 25.w, color: Colors.white);
    ;
  }
}
