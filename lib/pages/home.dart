import 'package:flutter/material.dart';
import 'package:flutter_chat/components/bottom_nav.dart';
import 'package:flutter_chat/pages/home/messages.dart';
import 'package:flutter_chat/pages/home/settings.dart';

class Home extends StatefulWidget{
    const Home({super.key});
    
    @override
    State<StatefulWidget> createState() => __HomeState();
}

class __HomeState extends State<Home>{
    final __pageController = PageController();
    int __index = 0;

    void navigate(int index){
        setState(() {
            __index = index;
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            bottomNavigationBar: BottomNav(active: __index, onChoose: navigate),
            body:  PageView(controller: __pageController, children: const [ Messages(), Settings()]),
        );
    }
}