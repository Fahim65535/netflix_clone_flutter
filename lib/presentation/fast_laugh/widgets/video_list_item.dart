import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/application/fast_laugh/fast_laugh_bloc.dart';

import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/strings.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads downloads;

  const VideoListItemInheritedWidget({
    Key? key,
    required this.widget,
    required this.downloads,
  }) : super(key: key, child: widget);

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.downloads != downloads;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItemWidget extends StatelessWidget {
  final int index;

  const VideoListItemWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.downloads.posterPath;
    final videoUrl = testvideoUrl[index % testvideoUrl.length];
    return Stack(
      children: [
        VideoPlayerFL(videoUrl: videoUrl, onChanged: (val) {}),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black.withOpacity(0.4),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_mute_rounded,
                      color: kwhiteColor,
                      size: 30,
                    ),
                  ),
                ),

                //right
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: posterPath == null
                            ? null
                            : NetworkImage('$imageAppendUrl$posterPath'),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: likedVideosIdsNotifier,
                      builder: (BuildContext context, Set<int> newLikedList,
                          Widget? _) {
                        //
                        final _index = index;
                        //
                        if (newLikedList.contains(_index)) {
                          return GestureDetector(
                            onTap: () {
                              likedVideosIdsNotifier.value.remove(_index);
                              likedVideosIdsNotifier.notifyListeners();
                            },
                            child: const VideoActionsWidget(
                              icon: Icons.emoji_emotions,
                              title: 'LOL',
                            ),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            likedVideosIdsNotifier.value.add(_index);
                            likedVideosIdsNotifier.notifyListeners();
                          },
                          child: const VideoActionsWidget(
                            icon: Icons.emoji_emotions_outlined,
                            title: 'LOL',
                          ),
                        );
                      },
                    ),
                    ValueListenableBuilder(
                      valueListenable: addToListNotifier,
                      builder: (BuildContext context, Set<int> addToList,
                          Widget? _) {
                        //
                        final _index = index;
                        //
                        if (addToList.contains(_index)) {
                          return GestureDetector(
                            onTap: () {
                              addToListNotifier.value.remove(_index);
                              addToListNotifier.notifyListeners();
                            },
                            child: const VideoActionsWidget(
                              icon: Icons.check,
                              title: 'My List',
                            ),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            addToListNotifier.value.add(_index);
                            addToListNotifier.notifyListeners();
                          },
                          child: const VideoActionsWidget(
                            icon: Icons.add,
                            title: 'My List',
                          ),
                        );
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        final movieName =
                            VideoListItemInheritedWidget.of(context)!
                                .downloads
                                .title;
                        if (movieName != null) {
                          Share.share(movieName);
                        }
                      },
                      child: const VideoActionsWidget(
                        icon: Icons.share,
                        title: 'Share',
                      ),
                    ),
                    const VideoActionsWidget(
                      icon: Icons.play_arrow,
                      title: 'Play',
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 14,
              color: kwhiteColor,
            ),
          ),
        ],
      ),
    );
  }
}

class VideoPlayerFL extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onChanged;
  const VideoPlayerFL({
    Key? key,
    required this.videoUrl,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<VideoPlayerFL> createState() => _VideoPlayerFLState();
}

class _VideoPlayerFLState extends State<VideoPlayerFL> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
