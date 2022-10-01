import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_app/application/new_and_hot/new_and_hot_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/core/strings.dart';
import 'package:netflix_app/presentation/home/widgets/custom_icon_text_widget.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/everybody_is_watching.dart';

import 'widgets/new_hot_coming_soon.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
              ),
              kWidth,
              Container(
                height: 10,
                width: 30,
                color: Colors.red,
              ),
              kWidth,
            ],
            bottom: TabBar(
              labelPadding: const EdgeInsets.all(12),
              labelColor: kblackColor,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelColor: kwhiteColor,
              isScrollable: true,
              indicator: BoxDecoration(
                color: kwhiteColor,
                borderRadius: kBRadius30,
              ),
              tabs: const [
                Text('🍿Coming soon'),
                Text("👀 Everyone's watching"),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            ComingSoonList(
              key: Key('cming_soon'),
            ),
            EverybodyIsWatchingList(
              key: Key('everybody_watching'),
            )
          ],
        ),
      ),
    );
  }
}

// Widget _buildComingSoon() {
//   return ListView.builder(
//     shrinkWrap: true,
//     itemCount: 10,
//     itemBuilder: (context, index) {
//       return const NewAndHotComingSoonCard();
//     },
//   );
// }

// Widget _buildEveryoneisWatching() {
//   return const SizedBox();
// }

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    //data loading event
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<NewAndHotBloc>(context).add(const LoadDataComingSoon());
      },
    );
    return BlocBuilder<NewAndHotBloc, NewAndHotState>(
      builder: (context, state) {
        //
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.isError) {
          return const Center(
            child: Text('Error while fetching data'),
          );
        } else if (state.comingSoonList.isEmpty) {
          return const Center(
            child: Text('List is Empty!'),
          );
        } else {
          return RefreshIndicator(
            color: Colors.grey,
            onRefresh: () async {
              BlocProvider.of<NewAndHotBloc>(context)
                  .add(const LoadDataComingSoon());
            },
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 15),
              shrinkWrap: true,
              itemCount: state.comingSoonList.length,
              itemBuilder: (context, index) {
                final movieData = state.comingSoonList[index];
                if (movieData.id == null) {
                  return const SizedBox();
                }

                String month = '';
                String date = '';
                try {
                  final _date = DateTime.tryParse(movieData.releaseDate!);
                  final formatedDate =
                      DateFormat.yMMMMd('en_US').format(_date!);
                  month = formatedDate
                      .split('  ')
                      .first
                      .substring(0, 3)
                      .toUpperCase();
                  date = movieData.releaseDate!.split('-')[2];
                } catch (e) {
                  month = '';
                  date = '';
                }

                return NewAndHotComingSoonCard(
                  id: movieData.id.toString(),
                  month: month,
                  day: date,
                  posterPath: '$imageAppendUrl${movieData.posterPath}',
                  movieName: movieData.originalTitle ?? 'No title',
                  description: movieData.overview ?? 'No description',
                );
              },
            ),
          );
        }
      },
    );
  }
}

class EverybodyIsWatchingList extends StatelessWidget {
  const EverybodyIsWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    //data loading event
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<NewAndHotBloc>(context)
            .add(const LoadEverybodyIsWatching());
      },
    );
    return BlocBuilder<NewAndHotBloc, NewAndHotState>(
      builder: (context, state) {
        //
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.isError) {
          return const Center(
            child: Text('Error while fetching data'),
          );
        } else if (state.everyoneisWatching.isEmpty) {
          return const Center(
            child: Text('List is Empty!'),
          );
        } else {
          return RefreshIndicator(
            color: Colors.grey,
            onRefresh: () async {
              BlocProvider.of<NewAndHotBloc>(context)
                  .add(const LoadEverybodyIsWatching());
            },
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 15),
              shrinkWrap: true,
              itemCount: state.everyoneisWatching.length,
              itemBuilder: (context, index) {
                final tvData = state.everyoneisWatching[index];
                if (tvData.id == null) {
                  return const SizedBox();
                }
                return EveryBodyIsWatchingWidget(
                  posterPath: '$imageAppendUrl${tvData.posterPath}',
                  tvName: tvData.originalName ?? 'No name provided',
                  description: tvData.overview ?? 'No overview provided',
                );
              },
            ),
          );
        }
      },
    );
  }
}
