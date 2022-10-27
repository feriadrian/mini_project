import 'package:flutter/material.dart';
import 'package:mini_projeck/config/config.dart';
import 'package:mini_projeck/constant/constant.dart';
import 'package:mini_projeck/pages/admin_page/components/regis_button.dart';
import 'package:mini_projeck/pages/login_page/components/input_field.dart';
import 'package:mini_projeck/services/auth_services.dart';
import 'package:mini_projeck/provider/provider.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatelessWidget {
  AdminPage({super.key});
  final _formkey = GlobalKey<FormState>();
  final _nisnC = TextEditingController();
  final _namaC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    SizeConfig().init(context);
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Expanded(flex: 1, child: Container()),
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    children: [
                      InputField(
                          validator: () {
                            if (_namaC.text.isEmpty) {
                              return 'Mohom Masukkan Nama.';
                            } else {
                              return null;
                            }
                          },
                          hintText: 'Nama',
                          keyboardType: TextInputType.name,
                          controller: _namaC),
                      SizedBox(
                        height: getPropertionateScreenHeight(24),
                      ),
                      InputField(
                          validator: () {
                            if (_nisnC.text.isEmpty) {
                              return 'Mohom Masukkan NISN.';
                            } else {
                              return null;
                            }
                          },
                          hintText: 'NISN',
                          keyboardType: TextInputType.number,
                          controller: _nisnC),
                      SizedBox(
                        height: getPropertionateScreenHeight(24),
                      ),
                      Spacer(),
                      RegisButton(
                        press: () async {
                          if (_formkey.currentState!.validate()) {
                            if (await AuthSerices.signUp(
                              nama: _namaC.text,
                              nisn: _nisnC.text,
                              password: defaultPassUSer,
                            )) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content:
                                      Text('Berhasil Melakukan Registrasi'),
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Text('NISN Telah Terdaftar'),
                                ),
                              );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
