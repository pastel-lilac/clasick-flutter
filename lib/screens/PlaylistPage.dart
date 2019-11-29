import 'package:clasick_flutter/models/Playlist.dart';
import 'package:clasick_flutter/music/MusicProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlaylistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final musicBloc = MusicProvider.of(context);
    return Scaffold(
      backgroundColor: Color(0xFFecd6c7),
      appBar: AppBar(
        title: const Text(
          'Playlist',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFFe79686),
      ),
      body: RefreshIndicator(
        child: StreamBuilder<List<Playlist>>(
          stream: musicBloc.playlist,
          builder: (context, snapshot) {
            if (snapshot == null || snapshot.data == null)
              return Center(child: CircularProgressIndicator());
            else
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black38),
                      ),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                        NetworkImage(snapshot.data[index].iconPath),
                      ),
                      title: Text(snapshot.data[index].name),
                      subtitle: Text(snapshot.data[index].description),
                      onTap: () => musicBloc.playMusicOnNowPlaying(),
                    ),
                  );
                });
            },
        ),
        onRefresh: () => null,
      ),
    );
  }
}
