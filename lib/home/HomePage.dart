import 'package:clasick_flutter/home/HomeBloc.dart';
import 'package:clasick_flutter/home/HomeProvider.dart';
import 'package:clasick_flutter/home/NowPlayingPage.dart';
import 'package:clasick_flutter/widgets/HomeBottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage();
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    final homeBloc = HomeProvider.of(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          StreamBuilder<NavBarSelection>(
              stream: homeBloc.itemStream,
              // ignore: missing_return
              builder: (BuildContext context,
                  AsyncSnapshot<NavBarSelection> snapshot) {
                if (snapshot.data == null)
                  return Center(child: CircularProgressIndicator());
                else {
                  return NowPlayingPage();
                }
              })
        ],
      ),
      bottomNavigationBar: HomeBottomNavigationBar(),
    );
  }
}
