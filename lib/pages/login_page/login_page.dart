import 'package:flutter/material.dart';
import 'package:mini_projeck/config/config.dart';
import 'package:mini_projeck/constant/constant.dart';
import 'package:mini_projeck/pages/admin_page/admin_page.dart';
import 'package:mini_projeck/pages/admin_page/components/regis_field.dart';
import 'package:mini_projeck/pages/home_page/home_page.dart';
import 'package:mini_projeck/pages/login_page/components/input_field.dart';
import 'package:mini_projeck/pages/login_page/components/login_button.dart';
import 'package:mini_projeck/pages/login_page/components/masuk_sebagai_admin.dart';
import 'package:mini_projeck/pages/materi_page/materi_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formkey = GlobalKey<FormState>();
  final _nisnC = TextEditingController();
  final _passC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Container(
          color: kPrimaryColor,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: getPropertionateScreenHeight(812 - 555),
                  decoration: BoxDecoration(color: kPrimaryColor),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                  ),
                  width: double.infinity,
                  height: getPropertionateScreenHeight(555),
                  decoration: BoxDecoration(
                    color: kBackgroundColor2,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: getPropertionateScreenHeight(38),
                      ),
                      Center(
                        child: Text(
                          'Login',
                          style: primaryTextStyle.copyWith(
                              fontSize: 36, fontWeight: bold),
                        ),
                      ),
                      SizedBox(
                        height: getPropertionateScreenHeight(31),
                      ),
                      InputField(
                        validator: () {
                          if (_nisnC.text == null || _nisnC.text.isEmpty) {
                            return 'Please Enter Your NISN.';
                          } else {
                            return null;
                          }
                        },
                        controller: _nisnC,
                        hintText: 'NISN',
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: getPropertionateScreenHeight(18),
                      ),
                      InputField(
                        validator: () {
                          if (_passC.text == null || _passC.text.isEmpty) {
                            return 'Please Enter Your Password.';
                          } else {
                            return null;
                          }
                        },
                        controller: _passC,
                        hintText: 'Password',
                        keyboardType: TextInputType.multiline,
                      ),
                      SizedBox(
                        height: getPropertionateScreenHeight(35),
                      ),
                      LoginButton(
                        press: () {
                          if (_formkey.currentState!.validate()) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          }
                          ;
                        },
                      ),
                      Spacer(),
                      MasukSebagaiAdmin(),
                      SizedBox(
                        height: getPropertionateScreenHeight(24),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
