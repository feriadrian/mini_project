import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mini_projeck/constant/constant.dart';
import 'package:mini_projeck/models/users_models.dart';
import 'package:mini_projeck/services/services.dart';

class UserProvider extends ChangeNotifier {
  List<UserModels> _userModels = [];
  List<UserModels> get userModels => _userModels;

  void addPlayer(String id, String email, String role) {
    DateTime dateTimeNow = DateTime.now();
    Uri url = Uri.parse(
        'https://mini-project-26683-default-rtdb.firebaseio.com/users.json');
    http.post(
      url,
      body: json.encode(
        {
          'id': id,
          'email': email,
          'role': role,
        },
      ),
    );
    _userModels.add(
      UserModels(id: id, email: email, role: role, createAt: DateTime.now()),
    );
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
