import 'package:flutter/material.dart';

class DrawerTiles extends StatelessWidget {
  DrawerTiles({this.icon, @required this.label, @required this.function});

  String label;
  IconData icon;
  Function function;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      title: Text(label),
      leading: Icon(icon),
    );
  }
}
