import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_projeck/config/config.dart';
import 'package:mini_projeck/constant/constant.dart';
import 'package:mini_projeck/pages/home_page/home_page.dart';

class RegisButton extends StatelessWidget {
  const RegisButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: getPropertionateScreenHeight(58),
        decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(
            getPropertionateScreenWidht(12),
          ),
        ),
        child: Center(
          child: Text(
            'Register',
            style: GoogleFonts.redHatDisplay(
                fontWeight: semiBold, fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
