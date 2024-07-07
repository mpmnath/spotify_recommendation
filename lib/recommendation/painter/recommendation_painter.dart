import 'dart:math';
import 'package:flutter/material.dart';
import 'package:spotify_recommendation/song_model.dart';

class RecommendationPainter extends CustomPainter {
  RecommendationPainter({required this.rootSong, required this.expandedSongs});
  final Song rootSong;
  final Set<Song> expandedSongs;

  final double padding = 10.0;
  final double radius = 20.0;
  final double displacementFactor = 0.75;
  final Paint cellPaintFill = Paint()
    ..color = Colors.white54
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    drawCell(canvas, center, rootSong);
  }

  void drawCell(Canvas canvas, Offset center, Song song) {
    if (song == null) return;

    final Rect rect =
        Rect.fromCenter(center: center, width: radius, height: radius);
    final RRect rrect =
        RRect.fromRectAndRadius(rect, const Radius.circular(10.0));
    canvas.drawRRect(rrect, cellPaintFill..color = Colors.black);
    song.centroid = center + Offset(radius / 2.0, radius / 2.0);
    song.rect = rect;

    if (expandedSongs.contains(song)) {
      final int totalChildren = song.children.length;
      final double angleStep = 2 * pi / totalChildren;

      for (int i = 0; i < totalChildren; i++) {
        final Song child = song.children[i];
        final double angle = i * angleStep;
        final double offsetX = (radius * 4 * displacementFactor) * cos(angle);
        final double offsetY = (radius * 4 * displacementFactor) * sin(angle);
        final Offset childCenter = center + Offset(offsetX, offsetY);
        canvas.drawLine(
          center,
          childCenter,
          cellPaintFill..color = Colors.black54,
        );
        drawCell(canvas, childCenter, child);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  Song? findTappedSong(Song? song, Offset tapPosition) {
    if (song == null || song.rect == null) return null;

    if (song.rect!.contains(tapPosition)) {
      return song;
    }

    for (var child in song.children) {
      var tappedChild = findTappedSong(child, tapPosition);
      if (tappedChild != null) {
        return tappedChild;
      }
    }

    return null;
  }
}
