import 'package:flutter/material.dart';
import 'package:meals/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          _drawerTitle(context),
          SizedBox(height: 20),
          _drawerLink(
            icon: Icons.restaurant,
            text: 'Meal',
            onTap: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          _drawerLink(
            icon: Icons.settings,
            text: 'Filters',
            onTap: () => Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName),
          ),
        ],
      ),
    );
  }
}

Widget _drawerTitle(BuildContext context) {
  return Container(
    height: 120,
    width: double.infinity,
    padding: EdgeInsets.all(20),
    alignment: Alignment.centerLeft,
    color: Theme.of(context).accentColor,
    child: Text(
      'Cooking Up!',
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 30,
        color: Theme.of(context).primaryColor,
      ),
    ),
  );
}

ListTile _drawerLink({
  @required IconData icon,
  @required String text,
  @required Function onTap,
}) {
  return ListTile(
    onTap: onTap,
    leading: Icon(
      icon,
      size: 26,
    ),
    title: Text(
      text,
      style: TextStyle(
        fontFamily: 'RobotoCondensed',
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
