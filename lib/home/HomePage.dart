import 'package:clasick_flutter/home/HomeBloc.dart';
import 'package:clasick_flutter/home/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage();
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    final homeBloc = HomeProvider.of(context);
    return Scaffold(
      body: StreamBuilder<NavBarSelection>(
        stream: homeBloc.itemStream,
        builder: (BuildContext context, AsyncSnapshot<NavBarSelection> snapshot) {
          if (snapshot.data == null) return Center(child: CircularProgressIndicator());
          switch (snapshot.data) {
            case NavBarSelection.Playlist:
              return Container(width: 0.0, height: 0.0);
            case NavBarSelection.MyMusic:
              return Container(width: 0.0, height: 0.0);
            case NavBarSelection.Search:
              return Container(width: 0.0, height: 0.0);
          }
          return null;
        },
      ),
      bottomNavigationBar: StreamBuilder(
        stream: homeBloc.itemStream,
        builder: (BuildContext context, AsyncSnapshot<NavBarSelection> snapshot) {
          return BottomNavigationBar(
            backgroundColor: Color(0xFFe79686),
            onTap: homeBloc.navBarIndex.add,
            currentIndex: snapshot.data.index,
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
