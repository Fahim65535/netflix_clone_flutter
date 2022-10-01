import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';

import '../../home/widgets/custom_icon_text_widget.dart';

class EveryBodyIsWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String tvName;
  final String description;
  const EveryBodyIsWatchingWidget({
    Key? key,
    required this.posterPath,
    required this.tvName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: SizedBox(
        width: double.infinity,
        height: 480,
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                        tvName,
                        style: kgoogleFontsBebe70,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                const CustomIconTextWidget(
                  icon: Icons.add,
                  text: 'My List',
                  iconsize: 20,
                  textSize: 12,
                ),
                kWidth,
                const CustomIconTextWidget(
                  icon: Icons.play_arrow,
                  text: 'Play',
                  iconsize: 20,
                  textSize: 12,
                ),
                kWidth,
                const CustomIconTextWidget(
                  icon: Icons.info,
                  text: 'Info',
                  iconsize: 20,
                  textSize: 12,
                ),
                kWidth,
              ],
            ),
            kHeight20,
            LimitedBox(
              child: Text(
                description,
                maxLines: 6,
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
    );
  }
}
