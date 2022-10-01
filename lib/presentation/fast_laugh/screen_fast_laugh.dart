import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/presentation/fast_laugh/widgets/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const InitializeFL());
    });
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FastLaughBloc, FastLaughState>(
          builder: (context, state) {
            //
            if (state.isLoading) {
              //
              return const Center(
                child: CircularProgressIndicator(),
              );
              //
            } else if (state.isError) {
              //
              return const Center(
                child: Text('Error while fetching data'),
              );
              //
            } else if (state.videoList.isEmpty) {
              //
              return const Center(
                child: Text('Video list is empty!'),
              );
              //
            } else {
              return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(
                  state.videoList.length,
                  (index) {
                    return VideoListItemInheritedWidget(
                      key: Key(index.toString()),
                      widget: VideoListItemWidget(index: index),
                      downloads: state.videoList[index],
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
