import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/splash_page.dart';
import 'package:flutter_chat/utils/constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
    await dotenv.load(fileName: ".env");
    WidgetsFlutterBinding.ensureInitialized();
    
    await Supabase.initialize(
        url: dotenv.env['SUPERBASE_URL'] ?? "",
        anonKey: dotenv.env['SUPERBASE_KEY'] ?? "");
        
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({ super.key });
    
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
