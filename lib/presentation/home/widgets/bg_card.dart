import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';

import 'custom_icon_text_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(kMainPageImage),
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          right: 25,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CustomIconTextWidget(
                icon: Icons.add,
                text: 'My List',
              ),
              _playButton(),
              const CustomIconTextWidget(
                icon: Icons.info_outline,
                text: 'Info',
                iconsize: 22,
              )
            ],
          ),
        ),
      ],
    );
  }
}

TextButton _playButton() {
  return TextButton.icon(
    onPressed: () {},
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(kwhiteColor),
    ),
    icon: const Icon(
      Icons.play_arrow,
      size: 20,
      color: kblackColor,
    ),
    label: Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Text(
        'Play',
        style: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: kblackColor,
        ),
      ),
    ),
  );
}
