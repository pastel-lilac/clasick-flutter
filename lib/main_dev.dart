import 'package:bloc_provider/bloc_provider.dart';
import 'package:clasick_flutter/home/HomePage.dart';
import 'package:clasick_flutter/home/HomeProvider.dart';
import 'package:clasick_flutter/services/MockMusicService.dart';
import 'package:clasick_flutter/widgets/Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'music/MusicProvider.dart';
import 'services/ServiceProvider.dart';

Future main() async {
  debugPaintSizeEnabled = false;
  runApp(const ServiceProvider(
    musicService: MockMusicService(),
    child: App(),
  ));
}

class App extends StatelessWidget {
  const App();
  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [MusicProvider(), HomeProvider()],
      child: MaterialApp(
        title: 'Clasick',
        theme: appTheme,
        home: const HomePage(),
        routes: {
          HomePage.routeName: (context) => const HomePage(),
        },
      ),
    );
  }
}
