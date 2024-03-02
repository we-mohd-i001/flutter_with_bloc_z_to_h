import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'counter_state.dart';

class CounterCubitNew extends Cubit<CounterState> with HydratedMixin{


  CounterCubitNew() : super(CounterState(counterValue: 0, wasIncremented: false));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decrement() => emit(
      CounterState(counterValue: state.counterValue - 1, wasIncremented: false));

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    addError(Exception('Cache failed'), StackTrace.current);
    onError(Exception('Cache Failed'), StackTrace.current);
    return state.toMap();
  }

  @override
  void onChange(Change<CounterState> change) {
    print(change);
    super.onChange(change);
  }
}