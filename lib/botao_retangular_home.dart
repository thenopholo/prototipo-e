import 'package:flutter/material.dart';

class BotaoRetangularHome extends StatelessWidget {
  IconData icon;
  String title;

  BotaoRetangularHome(
      {super.key,
      required this.icon,
      required this.title,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          margin: EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: Icon(
              color: Colors.red,
              icon, size: 28,
            ),
            title: Text(this.title),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ),
      ],
    );
  }
}
