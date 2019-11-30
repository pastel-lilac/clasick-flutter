import 'package:clasick_flutter/music/MusicProvider.dart';
import 'package:flutter/material.dart';

class MiniPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final musicBloc = MusicProvider.of(context);
    return Card(
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
    ]));
  }
}
