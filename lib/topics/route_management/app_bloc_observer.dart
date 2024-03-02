import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print(change.toString());
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);

    // TODO: implement onClose
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);

  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);

  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);

  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

  }
  
}