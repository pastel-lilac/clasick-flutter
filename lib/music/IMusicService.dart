import 'dart:async';
import 'package:clasick_flutter/models/Music.dart';

abstract class IMusicService {
  // Future<List<Album>> getAlbumsByArtistId(int artistId);
  Future<List<Music>> getAllMusicByPlaylistId(int playlistId);
}