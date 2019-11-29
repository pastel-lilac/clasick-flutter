import 'package:bloc_provider/bloc_provider.dart';
import 'package:clasick_flutter/services/ServiceProvider.dart';
import 'package:flutter/widgets.dart';

import 'MusicBloc.dart';

@immutable
class MusicProvider extends BlocProvider<MusicBloc> {
  MusicProvider({
    Widget child,
  }) : super(
    creator: (context, _bag) {
      final provider = ServiceProvider.of(context);
      return MusicBloc(musicService: provider.musicService);
    },
    child: child,
  );

  static MusicBloc of(BuildContext context) => BlocProvider.of(context);
}