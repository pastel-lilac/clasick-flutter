import 'dart:async';

import 'package:bloc_provider/bloc_provider.dart';
import 'package:clasick_flutter/models/Music.dart';
import 'package:clasick_flutter/models/Playlist.dart';
import 'package:clasick_flutter/music/IMusicService.dart';
import 'package:clasick_flutter/pkg/logger/SimpleLogger.dart';
import 'package:clasick_flutter/pkg/seed/SeedPlaylist.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class NowPlayingState {
  static String onShowing = "OnShowing";
  static String onHiding = "OnHiding";
}

@immutable
class NowPlaying {
  final String musicName;
  final String artistName;
  final String coverPath;
  final String state;
  NowPlaying(this.musicName, this.artistName, this.coverPath, this.state);
}

@immutable
class PlaylistSelection {
  final int playlistId;
  const PlaylistSelection(this.playlistId);
}

@immutable
class MusicBloc implements Bloc {
  // publish
  final _musics = BehaviorSubject<List<Music>>.seeded([]);
  final _playlists = BehaviorSubject<List<Playlist>>.seeded(SeedPlaylist.value);
  final _nowPlaying = BehaviorSubject<NowPlaying>.seeded(NowPlaying("", "", "", NowPlayingState.onHiding));
  // subscribe
  final _playlistSelectionController = StreamController<PlaylistSelection>();
  // constructor
  final IMusicService musicService;
  MusicBloc({@required this.musicService}){
    // set on listener
    this._playlistSelectionController.stream.listen(this._handlePlaylistSelection);
  }
  // Getter
  Sink<PlaylistSelection> get playlistSelection => _playlistSelectionController.sink;
  ValueObservable<List<Music>> get music => _musics.distinct().shareValueSeeded([]);
  ValueObservable<List<Playlist>> get playlist => _playlists.distinct().shareValueSeeded([]);
  ValueObservable<NowPlaying> get nowPlaying => _nowPlaying.distinct().shareValueSeeded(NowPlaying("", "", "", NowPlayingState.onHiding));
  // Handler
  Future<void> _handlePlaylistSelection(PlaylistSelection selection) async {
    final musics = await this.musicService.getAllMusicByPlaylistId(selection.playlistId);
    _musics.sink.add(musics);
    logger.info("debug: get musics by playlistId" + selection.playlistId.toString());
  }

  Future<void> clearNowPlaying() async {
    _nowPlaying.sink.add(NowPlaying("", "", "", NowPlayingState.onHiding));
  }

  Future<void> playMusicOnNowPlaying() async {
    _nowPlaying.sink.add(NowPlaying("", "", "", NowPlayingState.onShowing));
  }

  @override
  void dispose() {
    _musics.close();
    _playlists.close();
    _playlistSelectionController.close();
    _nowPlaying.close();
  }
}