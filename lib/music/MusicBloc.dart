import 'dart:async';

import 'package:bloc_provider/bloc_provider.dart';
import 'package:clasick_flutter/models/Music.dart';
import 'package:clasick_flutter/models/Playlist.dart';
import 'package:clasick_flutter/music/MusicService.dart';
import 'package:clasick_flutter/pkg/logger/SimpleLogger.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

@immutable
class PlaylistSelection {
  final int playlistId;
  const PlaylistSelection(this.playlistId);
}

@immutable
class MusicBloc implements Bloc {
  // publish
  final _musics = BehaviorSubject<List<Music>>.seeded([]);
  final _playlists = BehaviorSubject<List<Playlist>>.seeded([]);
  // subscribe
  final _playlistSelectionController = StreamController<PlaylistSelection>();

  final IMusicService musicService;
  MusicBloc({@required this.musicService}){
    // set on listener
    this._playlistSelectionController.stream.listen(this._handlePlaylistSelection);
  }
  // Getter
  Sink<PlaylistSelection> get playlistSelection => _playlistSelectionController.sink;
  ValueObservable<List<Music>> get music => _musics.distinct().shareValueSeeded([]);
  ValueObservable<List<Playlist>> get playlist => _playlists.distinct().shareValueSeeded([]);
  // Handler
  Future<void> _handlePlaylistSelection(PlaylistSelection selection) async {
    final musics = await this.musicService.getAllMusicByPlaylistId(selection.playlistId);
    _musics.sink.add(musics);
    logger.info("debug: get musics by playlistId" + selection.playlistId.toString());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _musics.close();
    _playlists.close();
    _playlistSelectionController.close();
  }
}