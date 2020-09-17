import 'dart:async';
import 'package:boti_challenge/screens/about/about_screen.dart';
import 'package:boti_challenge/screens/home/home_screen.dart';
import 'package:boti_challenge/screens/mural_screen/mural_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainTabScreen extends StatefulWidget {
  @override
  _MainTabScreenState createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen>
    with WidgetsBindingObserver {
  AppLifecycleState _currentAppState;

  bool _shouldReloadData = false;
  bool _shouldShowLoadingScreen = true;
  double _loadingScreenOpacity = 1;
  int _currentTabIndex = 0;
  List<Widget> _tabs;

  bool hasOpenOrders = false;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  List<Widget> loadTabChildren() {
    return [
      HomeScreen(),
      MuralScreen(),
      AboutScreen(),
    ];
  }

  List<Widget> currentTabScreenChildren() {
    if (_shouldReloadData) {
      _shouldReloadData = true; // tem que voltar isso pra false
      return loadTabChildren();
    } else {
      return _tabs;
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _tabs = loadTabChildren();

    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _loadingScreenOpacity = 0;
      });
    });
    Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        _shouldShowLoadingScreen = false;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      if (_currentAppState != AppLifecycleState.resumed &&
          state == AppLifecycleState.resumed) {
        _shouldReloadData = true;
      } else {
        _currentAppState = state;
        _shouldReloadData = false;
      }
    });
  }

  Widget getCurrentTabScreen() {
    return IndexedStack(
      index: _currentTabIndex,
      children: currentTabScreenChildren(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      child: Scaffold(
        body: getCurrentTabScreen(),
        bottomNavigationBar: bottomTabBar(),
      ),
    );
  }

  Widget bottomTabBar() {
    return BottomNavigationBar(
      onTap: onTabTapped,
      elevation: 0,
      currentIndex: _currentTabIndex,
      backgroundColor: Colors.white,
      items: [
        bottomNavigationBar(icon: Icons.home, label: 'Inicio'),
        bottomNavigationBar(icon: Icons.message, label: 'Mural'),
        bottomNavigationBar(icon: Icons.person, label: 'Sobre'),
      ],
    );
  }

  BottomNavigationBarItem bottomNavigationBar(
      {IconData icon, String label, bool displayBadge = false}) {
    return BottomNavigationBarItem(
      icon: Stack(
        children: <Widget>[
          Icon(icon, color: Theme.of(context).unselectedWidgetColor),
        ],
      ),
      activeIcon: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(
        label,
        style: TextStyle(color: Theme.of(context).unselectedWidgetColor),
      ),
    );
  }

  Widget loadingScreen() {
    return _shouldShowLoadingScreen
        ? AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: _loadingScreenOpacity,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Theme.of(context).primaryColor,
            ),
          )
        : Container();
  }
}
