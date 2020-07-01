class SongModel {
  final int id;
  final bool isFavorite;
  final String path;
  final String title;
  final String artist;
  final String album;
  final String genre;
  final Duration duration;

  SongModel({
    this.id,
    this.isFavorite,
    this.path,
    this.title,
    this.artist,
    this.album,
    this.genre,
    this.duration,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isFavorite': isFavorite,
      'path': path,
    };
  }

  static SongModel fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;

    return SongModel(
      id: map['id'],
      isFavorite: map['isFavorite'],
      path: map['path'],
      title: map['metadata']['title'],
      artist: map['metadata']['artist'],
      album: map['metadata']['album'],
      genre: map['metadata']['genre'],
      duration: Duration(milliseconds: map['duration']),
    );
  }

  SongModel copyWith({
    int id,
    bool isFavorite,
    String path,
    String title,
    String artist,
    String album,
    String genre,
    Duration duration,
  }) {
    return SongModel(
      id: id ?? this.id,
      isFavorite: isFavorite ?? this.isFavorite,
      path: path ?? this.path,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      album: album ?? this.album,
      genre: genre ?? this.genre,
      duration: duration ?? this.duration,
    );
  }
}
