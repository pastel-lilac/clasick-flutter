import 'package:clasick_flutter/music/MusicService.dart';
import 'package:flutter/widgets.dart';

@immutable
class ServiceProvider extends InheritedWidget {
  final IMusicService musicService;

  const ServiceProvider({
    @required this.musicService,
    @required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static ServiceProvider of(BuildContext context) => context
      .ancestorInheritedElementForWidgetOfExactType(ServiceProvider)
      .widget as ServiceProvider;
}