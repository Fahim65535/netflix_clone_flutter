import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';

class CustomIconTextWidget extends StatelessWidget {
  final IconData icon;
  final double iconsize;
  final String text;
  final double textSize;
  const CustomIconTextWidget({
    Key? key,
    required this.icon,
    this.iconsize = 25,
    required this.text,
    this.textSize = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhiteColor,
          size: iconsize,
        ),
        kHeight5,
        Text(
          text,
          style: GoogleFonts.montserrat(
            color: kwhiteColor,
            fontSize: textSize,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
