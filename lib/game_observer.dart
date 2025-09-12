import 'package:flutter_bloc/flutter_bloc.dart';

class GameObserver extends BlocObserver {
  const GameObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}
