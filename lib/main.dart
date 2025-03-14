import 'package:flutter/material.dart';
import 'package:flutter_chat/notifiers/users.dart';
import 'package:flutter_chat/pages/home.dart';
import 'package:flutter_chat/pages/home/messages.dart';
import 'package:flutter_chat/pages/login_page.dart';
import 'package:flutter_chat/pages/register_page.dart';
import 'package:flutter_chat/pages/splash_page.dart';
import 'package:flutter_chat/utils/constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
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
        return MultiProvider(
            providers: [
                ChangeNotifierProvider<UsersNotifier>(create: (_) => UsersNotifier()),
            ],
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'My Chat App',
                initialRoute: "splash",
                theme: appTheme,
                routes: {
                    "home": (_) => Home(),
                    "splash": (_) => SplashPage(),
                    "message": (_) => Messages(),
                    "login": (_) => LoginPage(),
                    "register": (_) => RegisterPage(isRegistering: false)
                },
            ),
        );
    }
}
