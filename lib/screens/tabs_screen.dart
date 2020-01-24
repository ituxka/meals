import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorites_screen.dart';

class _TabPage {
  final String title;
  final Widget page;

  _TabPage(this.title, this.page);
}

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<_TabPage> _tabPages = [
    _TabPage(CategoriesScreen.title, CategoriesScreen()),
    _TabPage(FavoritesScreen.title, FavoritesScreen()),
  ];

  int _selectedPageIndex = 0;

  void _onSelectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabPages[_selectedPageIndex].title),
      ),
      body: _tabPages[_selectedPageIndex].page,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        onTap: _onSelectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text(CategoriesScreen.title),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text(FavoritesScreen.title),
          ),
        ],
      ),
    );
  }
}
