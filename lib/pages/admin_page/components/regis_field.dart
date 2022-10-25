import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/config.dart';
import '../../../../constant/constant.dart';

class RegisField extends StatelessWidget {
  RegisField({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: kPrimaryColor),
        borderRadius: BorderRadius.circular(
          getPropertionateScreenWidht(12),
        ),
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              left: getPropertionateScreenWidht(20),
            ),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: GoogleFonts.redHatDisplay(
              fontSize: 16,
              fontWeight: regular,
            )),
      ),
    );
  }
}
