import 'package:flutter/material.dart';
import 'package:spotify_recommendation/recommendation/recommendation.dart';
import 'package:spotify_recommendation/song_model.dart';

class RecommendationPage extends StatelessWidget {
  const RecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.black.withOpacity(0.1),
      body: SafeArea(
        child: InteractiveViewer(
          panEnabled: true,
          panAxis: PanAxis.free,
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Center(
              child: BuildSongTree(
                song: songValues,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BuildSongTree extends StatefulWidget {
  const BuildSongTree({super.key, this.song});
  final Song? song;

  @override
  State<BuildSongTree> createState() => _BuildSongTreeState();
}

class _BuildSongTreeState extends State<BuildSongTree> {
  final Set<Song> _expandedSongs = <Song>{};

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        final song = depthFirstSearch(widget.song, (n) {
          if (n.rect == null) return false;
          return n.rect!.contains(details.localPosition);
        });
        setState(() {
          if (song != null) {
            if (_expandedSongs.contains(song)) {
              _expandedSongs.remove(song);
            } else {
              _expandedSongs.add(song);
            }
          }
        });
      },
      child: CustomPaint(
        size: Size.infinite,
        painter: RecommendationPainter(
          rootSong: widget.song!,
          expandedSongs: _expandedSongs,
        ),
      ),
    );
  }
}
