import 'package:flutter/material.dart';
import 'package:mini_projeck/config/config.dart';
import 'package:mini_projeck/constant/constant.dart';
import 'package:mini_projeck/pages/admin_page/components/regis_button.dart';
import 'package:mini_projeck/pages/admin_page/components/regis_field.dart';

class AdminPage extends StatelessWidget {
  AdminPage({super.key});
  final _formkey = GlobalKey<FormState>();
  final _nisnC = TextEditingController();
  final _passC = TextEditingController();
  final _namaC = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                    RegisButton(),
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
