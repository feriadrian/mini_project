import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mini_projeck/constant/constant.dart';
import 'package:mini_projeck/models/users_models.dart';
import 'package:mini_projeck/services/services.dart';

class UserProvider extends ChangeNotifier {
  late String _idToken;
  late String _userId;
  late DateTime _expiryDate;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_idToken != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _expiryDate != null) {
      return _idToken;
    } else {
      return null;
    }
  }

  Future<void> singUp(String email, String password) async {
    Uri url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBLoyyGLhfyw2K-kNdIcVluwjDy5mXvIVE');
    var response = await http.post(url,
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }));
    print(json.decode(response.body));
  }

  Future<void> singIn(String email, String password) async {
    Uri url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBLoyyGLhfyw2K-kNdIcVluwjDy5mXvIVE');
    var response = await http.post(url,
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }));
    print(json.decode(response.body));
  }
}
