import 'package:clasick_flutter/home/HomeBloc.dart';
import 'package:clasick_flutter/home/HomeProvider.dart';
import 'package:flutter/material.dart';

import 'Theme.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeBloc = HomeProvider.of(context);
    return StreamBuilder(
      stream: homeBloc.itemStream,
      builder: (BuildContext context, AsyncSnapshot<NavBarSelection> snapshot) {
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
    );
  }
}
