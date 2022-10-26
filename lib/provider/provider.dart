import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mini_projeck/pages/home_page/component/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:mini_projeck/services/services.dart';

class UserProvider extends ChangeNotifier {
  List<UserModel> _userModels = [];
  List<UserModel> get userModels => _userModels;

  Future<void> addUser(String nama, String nisn) {
    DateTime dateTimeNow = DateTime.now();

    Uri url = Uri.parse(
        'https://mini-project-26683-default-rtdb.firebaseio.com/users.json');
    return http
        .post(
      url,
      body: json.encode(
        {
          'nama': nama,
          'nisn': nisn,
          'createAt': dateTimeNow.toString(),
        },
      ),
    )
        .then(
      (response) {
        print('then function');
        _userModels.add(
          UserModel(
              id: json.decode(response.body)['nama'].toString(),
              nama: nama,
              nisn: nisn,
              createAt: dateTimeNow),
        );
        notifyListeners();
      },
    );
  }
}
