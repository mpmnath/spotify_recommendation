class RecommendationModel {
  RecommendationModel({
    required this.seeds,
    required this.tracks,
  });

  final List<Seed> seeds;
  final List<Track> tracks;

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      seeds: json["seeds"] == null
          ? []
          : List<Seed>.from(json["seeds"]!.map((x) => Seed.fromJson(x))),
      tracks: json["tracks"] == null
          ? []
          : List<Track>.from(json["tracks"]!.map((x) => Track.fromJson(x))),
    );
  }
}

class Seed {
  Seed({
    required this.afterFilteringSize,
    required this.afterRelinkingSize,
    required this.href,
    required this.id,
    required this.initialPoolSize,
    required this.type,
  });

  final int? afterFilteringSize;
  final int? afterRelinkingSize;
  final String? href;
  final String? id;
  final int? initialPoolSize;
  final String? type;

  factory Seed.fromJson(Map<String, dynamic> json) {
    return Seed(
      afterFilteringSize: json["afterFilteringSize"],
      afterRelinkingSize: json["afterRelinkingSize"],
      href: json["href"],
      id: json["id"],
      initialPoolSize: json["initialPoolSize"],
      type: json["type"],
    );
  }
}

class Track {
  Track({
    required this.album,
    required this.artists,
    required this.availableMarkets,
    required this.discNumber,
    required this.durationMs,
    required this.explicit,
    required this.externalIds,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.isPlayable,
    required this.linkedFrom,
    required this.restrictions,
    required this.name,
    required this.popularity,
    required this.previewUrl,
    required this.trackNumber,
    required this.type,
    required this.uri,
    required this.isLocal,
  });

  final Album? album;
  final List<TrackArtist> artists;
  final List<String> availableMarkets;
  final int? discNumber;
  final int? durationMs;
  final bool? explicit;
  final ExternalIds? externalIds;
  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final bool? isPlayable;
  final LinkedFrom? linkedFrom;
  final Restrictions? restrictions;
  final String? name;
  final int? popularity;
  final String? previewUrl;
  final int? trackNumber;
  final String? type;
  final String? uri;
  final bool? isLocal;

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      album: json["album"] == null ? null : Album.fromJson(json["album"]),
      artists: json["artists"] == null
          ? []
          : List<TrackArtist>.from(
              json["artists"]!.map((x) => TrackArtist.fromJson(x))),
      availableMarkets: json["available_markets"] == null
          ? []
          : List<String>.from(json["available_markets"]!.map((x) => x)),
      discNumber: json["disc_number"],
      durationMs: json["duration_ms"],
      explicit: json["explicit"],
      externalIds: json["external_ids"] == null
          ? null
          : ExternalIds.fromJson(json["external_ids"]),
      externalUrls: json["external_urls"] == null
          ? null
          : ExternalUrls.fromJson(json["external_urls"]),
      href: json["href"],
      id: json["id"],
      isPlayable: json["is_playable"],
      linkedFrom: json["linked_from"] == null
          ? null
          : LinkedFrom.fromJson(json["linked_from"]),
      restrictions: json["restrictions"] == null
          ? null
          : Restrictions.fromJson(json["restrictions"]),
      name: json["name"],
      popularity: json["popularity"],
      previewUrl: json["preview_url"],
      trackNumber: json["track_number"],
      type: json["type"],
      uri: json["uri"],
      isLocal: json["is_local"],
    );
  }
}

class Album {
  Album({
    required this.albumType,
    required this.totalTracks,
    required this.availableMarkets,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.releaseDate,
    required this.releaseDatePrecision,
    required this.restrictions,
    required this.type,
    required this.uri,
    required this.artists,
  });

  final String? albumType;
  final int? totalTracks;
  final List<String> availableMarkets;
  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final List<Image> images;
  final String? name;
  final String? releaseDate;
  final String? releaseDatePrecision;
  final Restrictions? restrictions;
  final String? type;
  final String? uri;
  final List<AlbumArtist> artists;

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      albumType: json["album_type"],
      totalTracks: json["total_tracks"],
      availableMarkets: json["available_markets"] == null
          ? []
          : List<String>.from(json["available_markets"]!.map((x) => x)),
      externalUrls: json["external_urls"] == null
          ? null
          : ExternalUrls.fromJson(json["external_urls"]),
      href: json["href"],
      id: json["id"],
      images: json["images"] == null
          ? []
          : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
      name: json["name"],
      releaseDate: json["release_date"],
      releaseDatePrecision: json["release_date_precision"],
      restrictions: json["restrictions"] == null
          ? null
          : Restrictions.fromJson(json["restrictions"]),
      type: json["type"],
      uri: json["uri"],
      artists: json["artists"] == null
          ? []
          : List<AlbumArtist>.from(
              json["artists"]!.map((x) => AlbumArtist.fromJson(x))),
    );
  }
}

class AlbumArtist {
  AlbumArtist({
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.name,
    required this.type,
    required this.uri,
  });

  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final String? name;
  final String? type;
  final String? uri;

  factory AlbumArtist.fromJson(Map<String, dynamic> json) {
    return AlbumArtist(
      externalUrls: json["external_urls"] == null
          ? null
          : ExternalUrls.fromJson(json["external_urls"]),
      href: json["href"],
      id: json["id"],
      name: json["name"],
      type: json["type"],
      uri: json["uri"],
    );
  }
}

class ExternalUrls {
  ExternalUrls({
    required this.spotify,
  });

  final String? spotify;

  factory ExternalUrls.fromJson(Map<String, dynamic> json) {
    return ExternalUrls(
      spotify: json["spotify"],
    );
  }
}

class Image {
  Image({
    required this.url,
    required this.height,
    required this.width,
  });

  final String? url;
  final int? height;
  final int? width;

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      url: json["url"],
      height: json["height"],
      width: json["width"],
    );
  }
}

class Restrictions {
  Restrictions({
    required this.reason,
  });

  final String? reason;

  factory Restrictions.fromJson(Map<String, dynamic> json) {
    return Restrictions(
      reason: json["reason"],
    );
  }
}

class TrackArtist {
  TrackArtist({
    required this.externalUrls,
    required this.followers,
    required this.genres,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.popularity,
    required this.type,
    required this.uri,
  });

  final ExternalUrls? externalUrls;
  final Followers? followers;
  final List<String> genres;
  final String? href;
  final String? id;
  final List<Image> images;
  final String? name;
  final int? popularity;
  final String? type;
  final String? uri;

  factory TrackArtist.fromJson(Map<String, dynamic> json) {
    return TrackArtist(
      externalUrls: json["external_urls"] == null
          ? null
          : ExternalUrls.fromJson(json["external_urls"]),
      followers: json["followers"] == null
          ? null
          : Followers.fromJson(json["followers"]),
      genres: json["genres"] == null
          ? []
          : List<String>.from(json["genres"]!.map((x) => x)),
      href: json["href"],
      id: json["id"],
      images: json["images"] == null
          ? []
          : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
      name: json["name"],
      popularity: json["popularity"],
      type: json["type"],
      uri: json["uri"],
    );
  }
}

class Followers {
  Followers({
    required this.href,
    required this.total,
  });

  final String? href;
  final int? total;

  factory Followers.fromJson(Map<String, dynamic> json) {
    return Followers(
      href: json["href"],
      total: json["total"],
    );
  }
}

class ExternalIds {
  ExternalIds({
    required this.isrc,
    required this.ean,
    required this.upc,
  });

  final String? isrc;
  final String? ean;
  final String? upc;

  factory ExternalIds.fromJson(Map<String, dynamic> json) {
    return ExternalIds(
      isrc: json["isrc"],
      ean: json["ean"],
      upc: json["upc"],
    );
  }
}

class LinkedFrom {
  LinkedFrom({required this.json});
  final Map<String, dynamic> json;

  factory LinkedFrom.fromJson(Map<String, dynamic> json) {
    return LinkedFrom(json: json);
  }
}
