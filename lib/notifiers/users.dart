import 'package:flutter/material.dart';
import 'package:flutter_chat/notifiers/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserState{
    final bool loading;
    final User? user;
    final String? error;
    final String message;

    const UserState({ this.loading = false, this.message = "", this.user, this.error });

    bool get isError => error != null;

    UserState copy({ String? message, bool? loading, User? user, String? error }){
        return UserState(
            message: message ?? this.message,
            loading: loading ?? this.loading,
            user: user ?? this.user,
        );
    }
}

class UsersNotifier extends ChangeNotifier{
    final UserRepository __repository = UserRepository();

    UserState __state = UserState();
    UserState get state => __state;

    void login({required String email, required String password, void Function()? done}){
        __state = __state.copy(loading: true, message: "Signing in, please wait..", error: null);
        notifyListeners();

        __repository.signIn(email: email, password: password).then((user){
            __state = __state.copy(user: user);
        }).onError<Exception>((error, s){
            __state = __state.copy(error: error.toString());
        }).whenComplete((){
            __state = __state.copy(loading: false);
            notifyListeners();
            if(done != null){
                done();
            }
        });
    }

    void signup({ required String username, required String email, required String password, void Function()? done }){
        __state = __state.copy(loading: true, message: "Registering, please wait..", error: null);
        notifyListeners();

        __repository.create(username: username, email: email, password: password).then((user){
            __state = __state.copy(user: user);
        }).onError<Exception>((error, s){
            __state = __state.copy(error: error.toString());
        }).whenComplete((){
            __state = __state.copy(loading: false);
            notifyListeners();
            if(done != null){
                done();
            }
        });
    }
}