import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/widgets.dart';
import 'HomeBloc.dart';

@immutable
class HomeProvider extends BlocProvider<HomeBloc> {
  HomeProvider({
    Widget child,
  }) : super(
    creator: (context, _bag) {
      return HomeBloc();
    },
    child: child,
  );

  static HomeBloc of(BuildContext context) => BlocProvider.of(context);
}