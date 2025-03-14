import 'package:flutter/material.dart';
import 'package:flutter_chat/utils/constants.dart';

/// Page to redirect users to the appropriate page depending on the initial auth state
class SplashPage extends StatefulWidget {
    const SplashPage({ super.key });

    @override
    SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
    late BuildContext __context;

    @override
    void initState() {
        super.initState();
        _redirect();
    }

    void _redirect(){
        // await for for the widget to mount
        Future.delayed(Duration(seconds: 5)).then((_){
            final session = supabase.auth.currentSession;
            if (session == null) {
                Navigator.popAndPushNamed(__context, "login");
            } else {
                Navigator.popAndPushNamed(__context, "home");
            }
        });
    }

    @override
    Widget build(BuildContext context) {
        __context = context;
        final ColorScheme theme = Theme.of(context).colorScheme;

        return Scaffold(
            body: Center(child: CircularProgressIndicator(color: theme.primary)));
    }
}
