import 'package:flutter/material.dart';

import 'package:netflix_app/core/constants.dart';

class MainCard extends StatelessWidget {
  final double height;
  final double width;
  final String imageUrl;
  final EdgeInsets? margin;
  const MainCard({
    Key? key,
    this.height = 0,
    this.width = 0,
    required this.imageUrl,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
