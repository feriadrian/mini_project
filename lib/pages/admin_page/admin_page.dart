import 'package:flutter/material.dart';
import 'package:mini_projeck/config/config.dart';
import 'package:mini_projeck/constant/constant.dart';
import 'package:mini_projeck/pages/admin_page/components/regis_button.dart';
import 'package:mini_projeck/pages/admin_page/components/regis_field.dart';
import 'package:mini_projeck/provider/auth_provider.dart';
import 'package:mini_projeck/provider/provider.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatelessWidget {
  AdminPage({super.key});
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final _formkey = GlobalKey<FormState>();
    final _nisnC = TextEditingController();
    final _passC = TextEditingController();
    final _namaC = TextEditingController();

    SizeConfig().init(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  children: [
                    RegisField(
                        hintText: 'Nama',
                        keyboardType: TextInputType.name,
                        controller: _namaC),
                    SizedBox(
                      height: getPropertionateScreenHeight(24),
                    ),
                    RegisField(
                        hintText: 'NISN',
                        keyboardType: TextInputType.number,
                        controller: _nisnC),
                    SizedBox(
                      height: getPropertionateScreenHeight(24),
                    ),
                    RegisField(
                        hintText: 'Password',
                        keyboardType: TextInputType.multiline,
                        controller: _passC),
                    Spacer(),
                    RegisButton(
                      press: () async {
                        if (await AuthProvider.signUp(
                          nama: _namaC.text,
                          nisn: _nisnC.text,
                          password: _passC.text,
                        )) {
                          print('Success');
                        } else {
                          print('Failed');
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
    );
  }
}
