import 'package:flutter/material.dart';
import 'package:shop/screens/cart.dart';
import 'package:shop/screens/feeds.dart';
import 'package:shop/screens/home.dart';
import 'package:shop/screens/search.dart';
import 'package:shop/screens/user.dart';

class BottomBarScreen extends StatefulWidget {
  static const routeName = "/BottomBarScreen";

  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List _pages = [
    HomeScreen(),
    FeedsScreen(),
    SearchScreen(),
    CartScreen(),
    UserScreen(),
  ];
  int _selectectedindex = 0;
  void _selectedPage(int index) {
    setState(() {
      _selectectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectectedindex],
      bottomNavigationBar: BottomAppBar(
        notchMargin: 3,
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        child: Container(
          decoration:
              BoxDecoration(border: Border(top: BorderSide(width: 0.5))),
          child: BottomNavigationBar(
            onTap: _selectedPage,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).textSelectionColor,
            selectedItemColor: Colors.yellow[700],
            currentIndex: _selectectedindex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.rss_feed), label: 'Feed'),
              BottomNavigationBarItem(
                  activeIcon: null, icon: Icon(null), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag), label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User')
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow[700],
        tooltip: 'Search',
        elevation: 5,
        child: (Icon(Icons.search)),
        onPressed: () {
          setState(() {
            _selectectedindex = 2;
          });
        },
      ),
    );
  }
}
