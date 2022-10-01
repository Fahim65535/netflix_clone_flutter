import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:netflix_app/core/constants.dart';

class NumberedMainCard extends StatelessWidget {
  final double height;
  final double width;
  final String imageUrl;
  final EdgeInsets? margin;
  final int index;
  const NumberedMainCard({
    Key? key,
    this.height = 0,
    this.width = 0,
    required this.imageUrl,
    this.margin,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 35,
              height: 100,
            ),
            Container(
              margin: margin,
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: kBRadius15,
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: -8,
          bottom: -30,
          child: BorderedText(
            strokeWidth: 3,
            strokeColor: Colors.white,
            child: Text(
              '${index + 1}',
              style: GoogleFonts.bebasNeue(
                color: Colors.black,
                fontSize: 160,
                decoration: TextDecoration.none,
                decorationColor: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
