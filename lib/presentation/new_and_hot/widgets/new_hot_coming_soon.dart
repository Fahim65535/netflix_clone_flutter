import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';

import '../../home/widgets/custom_icon_text_widget.dart';

class NewAndHotComingSoonCard extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;
  const NewAndHotComingSoonCard({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        kHeight20,
        SizedBox(
          width: 50,
          height: 550,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                month,
                style: kgoogleFontsBebe18,
              ),
              Text(
                day,
                style: kgoogleFontsBebe30,
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 550,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        posterPath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.black.withOpacity(0.5),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.volume_mute_rounded,
                            color: kwhiteColor,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              kHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LimitedBox(
                    maxWidth: 220,
                    child: FittedBox(
                      child: BorderedText(
                        strokeColor: Colors.black,
                        strokeWidth: 4,
                        child: Text(
                          movieName,
                          style: kgoogleFontsBebe70,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      CustomIconTextWidget(
                        icon: Icons.alarm,
                        text: 'Remind Me',
                        iconsize: 20,
                        textSize: 12,
                      ),
                      kWidth,
                      CustomIconTextWidget(
                        icon: Icons.info,
                        text: 'Info',
                        iconsize: 20,
                        textSize: 12,
                      ),
                      kWidth,
                    ],
                  ),
                ],
              ),
              kHeight20,
              Text(
                'Coming on $day $month ',
                style: kgoogleFonts16,
              ),
              kHeight,
              Text(
                movieName,
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: kgoogleFontsBebe25,
              ),
              kHeight,
              LimitedBox(
                child: Text(
                  description,
                  maxLines: 4,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
