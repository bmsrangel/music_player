import 'song_model.dart';

class PlaylistModel {
  final int id;
  final String name;
  final List<SongModel> songs;

  PlaylistModel({this.id, this.name, this.songs});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'songs': songs?.map((x) => x?.toMap())?.toList(),
    };
  }

  static PlaylistModel fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return PlaylistModel(
      id: map['id'],
      name: map['name'],
      songs:
          List<SongModel>.from(map['songs']?.map((x) => SongModel.fromMap(x))),
    );
  }
}
