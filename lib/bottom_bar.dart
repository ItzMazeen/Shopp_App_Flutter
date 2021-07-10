import 'package:flutter/material.dart';
import 'package:shop/screens/cart.dart';
import 'package:shop/screens/feeds.dart';
import 'package:shop/screens/home.dart';
import 'package:shop/screens/search.dart';
import 'package:shop/screens/user.dart';

import 'consts/my_icons.dart';

class BottomBarScreen extends StatefulWidget {
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': HomeScreen(),
      },
      {
        'page': FeedsScreen(),
      },
      {
        'page': SearchScreen(),
      },
      {
        'page': CartScreen(),
      },
      {
        'page': UserScreen(),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        // color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight * 0.98,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
              onTap: _selectPage,
              backgroundColor: Theme.of(context).primaryColor,
              // ignore: deprecated_member_use
              unselectedItemColor: Theme.of(context).textSelectionColor,
              selectedItemColor: Colors.yellow[700],
              currentIndex: _selectedPageIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.home),
                  // ignore: deprecated_member_use
                  title: Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.rss),
                  // ignore: deprecated_member_use
                  title: Text('Feeds'),
                ),
                BottomNavigationBarItem(
                  activeIcon: null,
                  icon: Icon(null),
                  // ignore: deprecated_member_use
                  title: Text('Search'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    MyAppIcons.cart,
                  ),
                  // ignore: deprecated_member_use
                  title: Text('Cart'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.user),
                  // ignore: deprecated_member_use
                  title: Text('User'),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          hoverElevation: 10,
          splashColor: Colors.grey,
          tooltip: 'Search',
          elevation: 4,
          child: Icon(MyAppIcons.search),
          onPressed: () => setState(() {
            _selectedPageIndex = 2;
          }),
        ),
      ),
    );
  }
}
