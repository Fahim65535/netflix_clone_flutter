import 'package:flutter/material.dart';

import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/number_card.dart';
import 'package:netflix_app/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  final String title;
  final List<String> posterList;
  const NumberTitleCard(
      {Key? key, required this.title, required this.posterList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kHeight,
        LimitedBox(
          maxHeight: 220,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              posterList.length,
              (index) => NumberedMainCard(
                index: index,
                margin: const EdgeInsets.only(bottom: 15),
                height: 250,
                width: 140,
                imageUrl: posterList[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
