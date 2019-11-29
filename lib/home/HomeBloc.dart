import 'dart:async';

import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

enum NavBarSelection {Playlist, MyMusic, Search}

@immutable
class HomeBloc implements Bloc {
  final _navBarSelectionController = BehaviorSubject<NavBarSelection>.seeded(NavBarSelection.Playlist);
  final _navBarIndexController = BehaviorSubject<int>.seeded(0);

  HomeBloc(){
    // set on listener
    this._navBarIndexController.stream.listen(this._handleOnPickedItem);
  }
  Sink<int> get navBarIndex => _navBarIndexController.sink;
  Stream<NavBarSelection> get itemStream => _navBarSelectionController.stream;
  void _handleOnPickedItem(int i) {
    switch (i) {
      case 0:
        _navBarSelectionController.add(NavBarSelection.Playlist);
        return;
      case 1:
        _navBarSelectionController.add(NavBarSelection.MyMusic);
        return;
      case 2:
        _navBarSelectionController.add(NavBarSelection.Search);
        return;
    }
  }

  @override
  void dispose() {
    _navBarSelectionController.close();
    _navBarIndexController.close();
  }
}