import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_projeck/config/config.dart';
import 'package:mini_projeck/constant/constant.dart';
import 'package:mini_projeck/pages/home_page/component/custom_drawer.dart';
import 'package:mini_projeck/pages/home_page/component/header.dart';
import 'package:mini_projeck/pages/home_page/component/list_cover_gridview.dart';
import 'package:mini_projeck/pages/home_page/component/qoute_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: CustomDrawer(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              HeaderHome(scaffoldKey: _scaffoldKey),
              SizedBox(
                height: getPropertionateScreenHeight(31),
              ),
              QuoteCard(),
              SizedBox(
                height: getPropertionateScreenHeight(32),
              ),
              Text(
                'Silahkan Pilihan Materi Dibawah',
                style:
                    primaryTextStyle.copyWith(fontSize: 24, fontWeight: bold),
              ),
              SizedBox(
                height: getPropertionateScreenHeight(32),
              ),
              Expanded(
                child: DelayedDisplay(
                  delay: Duration(milliseconds: 500),
                  child: GridMateri(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
