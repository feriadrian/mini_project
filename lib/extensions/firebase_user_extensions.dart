import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_projeck/pages/home_page/component/user_model.dart';
import 'package:mini_projeck/provider/provider.dart';

extension FirebaseUserExtension on User {
  UserModel convertToUser({
    String id = '',
    String nama = '',
    String nisn = '',
  }) =>
      UserModel(
        nama: nama,
        nisn: nisn,
        id: id,
        createAt: DateTime.now(),
      );

  Future<UserModel>() async => await UserProvider().addUser('nama', 'sads');
}
