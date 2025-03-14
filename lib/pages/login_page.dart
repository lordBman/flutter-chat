import 'package:flutter/material.dart';
import 'package:flutter_chat/notifiers/users.dart';
import 'package:flutter_chat/utils/constants.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
    const LoginPage({ super.key });
    
    @override
    State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    late UsersNotifier __usersNotifier;
    
    void __signIn(){
        __usersNotifier.login(email: _emailController.text, password: _passwordController.text,done: (){
            if(__usersNotifier.state.isError){
                context.showErrorSnackBar(message: __usersNotifier.state.error!);
            }else{
                Navigator.pushReplacementNamed(context, "home");
            }
        });
    }

    @override
    void dispose() {
        _emailController.dispose();
        _passwordController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        __usersNotifier = context.watch<UsersNotifier>();
        
        return Scaffold(
            appBar: AppBar(title: const Text('Sign In')),
            body: Padding(padding: formPadding,
                child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(labelText: 'Email'),
                            keyboardType: TextInputType.emailAddress),
                        formSpacer,
                        TextFormField(
                            controller: _passwordController,
                            decoration: const InputDecoration(labelText: 'Password'),
                            obscureText: true),
                        formSpacer,
                        ElevatedButton(
                            onPressed: __usersNotifier.state.loading ? null : __signIn,
                            child: const Text('Login')),
                    ],
                ),
            ),
        );
    }
}
