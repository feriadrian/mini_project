import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mini_projeck/pages/home_page/component/user_model.dart';
import 'package:mini_projeck/provider/provider.dart';

class AuthSerices extends ChangeNotifier {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  void singIn(String nisn, String password) async {
    Uri url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithCustomToken?key=AIzaSyBLoyyGLhfyw2K-kNdIcVluwjDy5mXvIVE');
    var response = await http.post(
      url,
      body: json.encode({
        'nisn': nisn,
        'password': password,
        'returnSecureToken': true,
      }),
    );
    print(json.decode(response.body));
  }

  static Future<bool> signUp(
      {required String nama,
      required String nisn,
      required String password}) async {
    try {
      String email = nisn + '@example.com';

      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // ...

      await UserProvider().addUser(nama, nisn);

      // ...

      return true;

      // ...

    } catch (e) {
      print(e);
      return false;
    }
  }

  // static Future<bool> signIn(String email, String password) async {
  //   try {
  //     UserCredential authCredential = await _auth.signInWithEmailAndPassword(
  //         email: email, password: password);

  //     UserModel? users = await authCredential.user!.fromFireStore();
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }
}
