import 'package:clasick_flutter/models/Music.dart';
import 'package:meta/meta.dart';

import '../models/Music.dart';
import '../music/IMusicService.dart';

@immutable
class MockMusicService implements IMusicService {
  const MockMusicService();

  @override
  Future<List<Music>> getAllMusicByPlaylistId(int playlistId) async {
    // TODO: implement getAllMusicByPlaylistId
    List<Music> result = List<Music>();
    Music a = Music(1, "Canon in D");
    result.add(a);
    return result;
  }
}