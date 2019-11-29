import 'package:clasick_flutter/home/HomeBloc.dart';
import 'package:clasick_flutter/home/HomeProvider.dart';
import 'package:clasick_flutter/music/MusicBloc.dart';
import 'package:clasick_flutter/music/MusicProvider.dart';
import 'package:clasick_flutter/screens/PlaylistPage.dart';
import 'package:clasick_flutter/widgets/Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage();
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    final homeBloc = HomeProvider.of(context);
    final musicBloc = MusicProvider.of(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          StreamBuilder<NavBarSelection>(
            stream: homeBloc.itemStream,
            builder: (BuildContext context,
                AsyncSnapshot<NavBarSelection> snapshot) {
              if (snapshot.data == null)
                return Center(child: CircularProgressIndicator());
              switch (snapshot.data) {
                case NavBarSelection.Playlist:
                  return PlaylistPage();
                case NavBarSelection.MyMusic:
                  return Container(width: 0.0, height: 0.0);
                case NavBarSelection.Search:
                  return Container(width: 0.0, height: 0.0);
              }
              return null;
            },
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: StreamBuilder<NowPlaying>(
              stream: musicBloc.nowPlaying,
              builder:
                  (BuildContext context, AsyncSnapshot<NowPlaying> snapshot) {
                  bool isVisible = snapshot.data.state == NowPlayingState.onShowing ? true : false;
                  return Visibility(
                    visible: isVisible,
                    child: Card(
                        child: Stack(children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://is3-ssl.mzstatic.com/image/thumb/Purple118/v4/2d/27/1c/2d271c48-df04-5cc9-e9ab-fcd3c79f0da3/source/512x512bb.jpg'),
                        ),
                        title: Text('Heart Shaker'),
                        subtitle: Text('TWICE'),
                      ),
                      ButtonTheme.bar(
                        // make buttons use the appropriate styles for cards
                        child: ButtonBar(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.pause),
                              onPressed: () {/* ... */},
                            ),
                            IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () => musicBloc.clearNowPlaying(),
                            ),
                          ],
                        ),
                      )
                    ])),
                  );
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: StreamBuilder(
        stream: homeBloc.itemStream,
        builder:
            (BuildContext context, AsyncSnapshot<NavBarSelection> snapshot) {
          return BottomNavigationBar(
            backgroundColor: bottomNavBarTheme,
            currentIndex: snapshot.data.index,
            onTap: homeBloc.navBarIndex.add,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                title: Text('PlayList'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.audiotrack),
                title: Text('My Music'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Search'),
              )
            ],
          );
        },
      ),
    );
  }
}
