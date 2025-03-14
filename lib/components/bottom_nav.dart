import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget{
    final int active;
    final void Function(int index) onChoose;

    const BottomNav({ super.key, required this.active, required this.onChoose });

    @override
    Widget build(BuildContext context) {
        return BottomNavigationBar(onTap: onChoose, items: [
            BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: "Messages"),
            BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: "Settings")
        ]);
    }
}