import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/splash_page.dart';
import 'package:flutter_chat/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://pxzlubzyvgnffgvayymo.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB4emx1Ynp5dmduZmZndmF5eW1vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDE2ODk1ODMsImV4cCI6MjA1NzI2NTU4M30.Q26uVLbQPPlWp8CLdjKkY19XvVnbEwzl3YIpMWHA8rg',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Chat App',
      theme: appTheme,
      home: const SplashPage(),
    );
  }
}
