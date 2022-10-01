import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/home/home_bloc.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/core/strings.dart';
import 'package:netflix_app/presentation/home/widgets/bg_card.dart';
import 'package:netflix_app/presentation/widgets/main_title_card.dart';
import 'widgets/number_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<HomeBloc>(context).add(const GetHomeData());
      },
    );
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              // print(direction);
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    //
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state.isError) {
                      return const Center(
                        child: Text(
                          'Error while fetching data',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                    }

                    //movies released in past year
                    final pastYearMovie = state.releasedinPastYear.map((movie) {
                      return "$imageAppendUrl${movie.posterPath}";
                    }).toList();
                    pastYearMovie.shuffle();

                    //trending movies
                    final trendingMovies = state.trendingMovies.map((movie) {
                      return "$imageAppendUrl${movie.posterPath}";
                    }).toList();

                    //tense dramas
                    final dramas = state.dramas.map((movie) {
                      return "$imageAppendUrl${movie.posterPath}";
                    }).toList();

                    //movies4u
                    final movies4u = state.moviesForYou.map((movie) {
                      return "$imageAppendUrl${movie.posterPath}";
                    }).toList();

                    //top10shows
                    final top10shows = state.top10ShowsinUAE.map((movie) {
                      return "$imageAppendUrl${movie.posterPath}";
                    }).toList();

                    return ListView(
                      children: [
                        const BackgroundCard(),
                        kHeight,
                        if (pastYearMovie.length >= 10)
                          MainTitleCard(
                            title: 'Released in the Past Year',
                            posterList: pastYearMovie.sublist(0, 10),
                          ),
                        if (top10shows.length >= 10)
                          NumberTitleCard(
                            title: 'Top 10 Movies in UAE Today',
                            posterList: top10shows.sublist(0, 10),
                          ),
                        if (trendingMovies.length >= 10)
                          MainTitleCard(
                            title: 'Trending Movies',
                            posterList: trendingMovies.sublist(0, 10),
                          ),
                        if (dramas.length >= 10)
                          MainTitleCard(
                            title: 'Tense Dramas',
                            posterList: dramas.sublist(0, 10),
                          ),
                        if (movies4u.length >= 10)
                          MainTitleCard(
                            title: 'Movies For You',
                            posterList: movies4u.sublist(0, 10),
                          ),
                      ],
                    );
                  },
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        width: double.infinity,
                        height: 100,
                        color: Colors.black.withOpacity(0.5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  'https://pngimg.com/uploads/netflix/netflix_PNG22.png',
                                  width: 80,
                                  height: 80,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  color: Colors.white,
                                ),
                                kWidth,
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                TopBarRowText(text: 'Tv Shows'),
                                TopBarRowText(text: 'Movies'),
                                TopBarRowText(text: 'Categories'),
                              ],
                            ),
                          ],
                        ),
                      )
                    : kHeight,
              ],
            ),
          );
        },
      ),
    );
  }
}

class TopBarRowText extends StatelessWidget {
  final String text;
  const TopBarRowText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: kgoogleFonts16);
  }
}
