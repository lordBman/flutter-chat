import 'dart:developer';

import 'package:flutter_chat/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepository {
    Future<User> signIn({ required String email, required String password }) async {
        try {
            AuthResponse response = await supabase.auth.signInWithPassword( email: email, password: password);

            return response.user!;
        } on AuthException catch (error) {
            throw Exception(error.message);
        } catch (erorr) {
            log("Login error", error: erorr);
            throw Exception("Server error, please try again later");
        }
    }

    Future<User> create({ required String username, required String email, required String password }) async{
        try {
            AuthResponse response = await supabase.auth.signUp(email: email, password: password, data: {'username': username});

            return response.user!;
        }on AuthException catch (error) {
            throw Exception(error.message);
        } catch (erorr) {
            log("Login error", error: erorr);
            throw Exception("Server error, please try again later");
        }
    }
}