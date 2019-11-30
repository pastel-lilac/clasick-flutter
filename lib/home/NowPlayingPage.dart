import 'package:clasick_flutter/home/HomeBloc.dart';
import 'package:clasick_flutter/home/HomeProvider.dart';
import 'package:clasick_flutter/music/MusicBloc.dart';
import 'package:clasick_flutter/music/MusicProvider.dart';
import 'package:clasick_flutter/screens/PlaylistPage.dart';
import 'package:clasick_flutter/widgets/MiniPlayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class NowPlayingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeBloc = HomeProvider.of(context);
    final musicBloc = MusicProvider.of(context);
    return StreamBuilder<NavBarSelection>(
        stream: homeBloc.itemStream,
        // ignore: missing_return
        builder:
            (BuildContext context, AsyncSnapshot<NavBarSelection> snapshot) {
          if (snapshot.data == null)
            return Center(child: CircularProgressIndicator());
          else {
            return SlidingUpPanel(
              backdropEnabled: true,
              maxHeight: MediaQuery.of(context).size.height,
              renderPanelSheet: false,
              panel: Center(
                child: Text("This is the sliding Widget"),
              ),
              collapsed: StreamBuilder<NowPlaying>(
                  stream: musicBloc.nowPlaying,
                  builder: (BuildContext context,
                      AsyncSnapshot<NowPlaying> snapshot) {
                    bool isVisible =
                        snapshot.data.state == NowPlayingState.onShowing
                            ? true
                            : false;
                    return Visibility(
                      visible: isVisible,
                      child: MiniPlayer(),
                    );
                  }),
              body: _currentPage(snapshot.data),
            );
          }
        });
  }
}

Widget _currentPage(NavBarSelection nav) {
  switch (nav) {
    case NavBarSelection.Playlist:
      return PlaylistPage();
    case NavBarSelection.MyMusic:
      return Container(width: 0.0, height: 0.0);
    case NavBarSelection.Search:
      return Container(width: 0.0, height: 0.0);
    default:
      return Container(width: 0.0, height: 0.0);
  }
}
