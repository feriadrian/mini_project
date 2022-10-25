import 'package:flutter/material.dart';
import 'package:mini_projeck/constant/constant.dart';
import 'package:mini_projeck/pages/admin_page/admin_page.dart';
import 'package:mini_projeck/pages/login_page/components/input_field.dart';

class MasukSebagaiAdmin extends StatelessWidget {
  MasukSebagaiAdmin({
    Key? key,
  }) : super(key: key);

  final _formkey = GlobalKey<FormState>();
  final _adminC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Masuk Sebagai',
          style: primaryTextStyle.copyWith(fontSize: 14, fontWeight: light),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return Form(
                  key: _formkey,
                  child: AlertDialog(
                    actions: [
                      TextButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return AdminPage();
                                },
                              ),
                            );
                          }
                        },
                        child: Text('Masuk'),
                      ),
                    ],
                    content: InputField(
                        validator: () {
                          if (_adminC.text != passAdmin) {
                            return 'Mohom Masukkan Sandi Yang Benar.';
                          } else {
                            return null;
                          }
                        },
                        hintText: 'Admin',
                        keyboardType: TextInputType.emailAddress,
                        controller: _adminC),
                  ),
                );
              },
            );
          },
          child: Text(
            ' Admin',
            style: primaryTextStyle.copyWith(
              fontSize: 14,
              fontWeight: light,
              color: kPrimaryColor,
            ),
          ),
        )
      ],
    );
  }
}
