// Create a tree structure for the song model

import 'package:flutter/material.dart';

class Song {
  final String title;
  final String? artist;
  final String? album;
  final String? albumArt;
  final String? url;
  String? value;
  Offset? centroid;
  Rect? rect;
  Size? visualSize;
  final List<Song> children;

  Song({
    required this.title,
    this.artist,
    this.album,
    this.albumArt,
    this.url,
    required this.children,
  });

  @override
  String toString() {
    return 'Song{title: $title, artist: $artist, album: $album, albumArt: $albumArt, url: $url, value: $value, centroid: $centroid, rect: $rect, visualSize: $visualSize, children: $children}';
  }
}

Song? depthFirstSearch(Song? song, bool Function(Song n) predicate) {
  if (song == null) {
    return song;
  }
  if (song.children.isEmpty) {
    return predicate(song) ? song : null;
  }
  if (predicate(song)) return song;
  for (var i = 0; i < song.children.length; i++) {
    final m = depthFirstSearch(song.children[i], predicate);
    if (m != null) return m;
  }
  return null;
}

void deleteNode(Song? song, Offset pos) {
  if (song == null) return;

  var foundAt = -1;
  for (var i = 0; i < song.children!.length; i++) {
    if (song.children[i].rect!.contains(pos)) {
      foundAt = i;
      break;
    }
  }

  if (foundAt != -1) {
    song.children.removeAt(foundAt);
    return;
  }

  for (var i = 0; i < song.children!.length; i++) {
    deleteNode(song.children![i], pos);
  }
}

final Song songValues = Song(
  title: '1',
  artist: 'Artist Name',
  album: 'Album Name',
  albumArt: 'Album Art URL',
  url: 'Song URL',
  children: [
    Song(
      title: '2',
      artist: 'Artist Name',
      album: 'Album Name',
      albumArt: 'Album Art URL',
      url: 'Song URL',
      children: [
        Song(
          title: '21',
          artist: 'Artist Name',
          album: 'Album Name',
          albumArt: 'Album Art URL',
          url: 'Song URL',
          children: [],
        ),
      ],
    ),
    Song(
      title: '3',
      artist: 'Artist Name',
      album: 'Album Name',
      albumArt: 'Album Art URL',
      url: 'Song URL',
      children: [
        Song(
          title: '31',
          artist: 'Artist Name',
          album: 'Album Name',
          albumArt: 'Album Art URL',
          url: 'Song URL',
          children: [],
        ),
      ],
    ),
    Song(
      title: '4',
      artist: 'Artist Name',
      album: 'Album Name',
      albumArt: 'Album Art URL',
      url: 'Song URL',
      children: [
        Song(
          title: '41',
          artist: 'Artist Name',
          album: 'Album Name',
          albumArt: 'Album Art URL',
          url: 'Song URL',
          children: [],
        ),
      ],
    ),
    Song(
      title: '5',
      artist: 'Artist Name',
      album: 'Album Name',
      albumArt: 'Album Art URL',
      url: 'Song URL',
      children: [
        Song(
          title: '51',
          artist: 'Artist Name',
          album: 'Album Name',
          albumArt: 'Album Art URL',
          url: 'Song URL',
          children: [],
        ),
      ],
    ),
    Song(
      title: '6',
      artist: 'Artist Name',
      album: 'Album Name',
      albumArt: 'Album Art URL',
      url: 'Song URL',
      children: [
        Song(
          title: '61',
          artist: 'Artist Name',
          album: 'Album Name',
          albumArt: 'Album Art URL',
          url: 'Song URL',
          children: [
            Song(
              title: '611',
              artist: 'Artist Name',
              album: 'Album Name',
              albumArt: 'Album Art URL',
              url: 'Song URL',
              children: [
                Song(
                  title: '6111',
                  artist: 'Artist Name',
                  album: 'Album Name',
                  albumArt: 'Album Art URL',
                  url: 'Song URL',
                  children: [
                    Song(
                      title: '61111',
                      artist: 'Artist Name',
                      album: 'Album Name',
                      albumArt: 'Album Art URL',
                      url: 'Song URL',
                      children: [],
                    ),
                  ],
                ),
              ],
            ),
            Song(
              title: '612',
              artist: 'Artist Name',
              album: 'Album Name',
              albumArt: 'Album Art URL',
              url: 'Song URL',
              children: [
                Song(
                  title: '6111',
                  artist: 'Artist Name',
                  album: 'Album Name',
                  albumArt: 'Album Art URL',
                  url: 'Song URL',
                  children: [
                    Song(
                      title: '622222',
                      artist: 'Artist Name',
                      album: 'Album Name',
                      albumArt: 'Album Art URL',
                      url: 'Song URL',
                      children: [],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
