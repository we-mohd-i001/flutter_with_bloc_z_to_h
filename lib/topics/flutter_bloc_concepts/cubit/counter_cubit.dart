import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterInitial> with HydratedMixin {
  CounterCubit() : super(const CounterInitial(0));

  void increment() => emit(CounterInitial(state.counterValue +1));
  void decrement() => emit(CounterInitial(state.counterValue -1));
  void decreaseTen() => emit(CounterInitial(state.counterValue -10));
  void increaseTen() => emit(CounterInitial(state.counterValue +10));

  @override
  CounterInitial? fromJson(Map<String, dynamic> json) {
    return CounterInitial.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterInitial state) {
    return state.toMap();
  }
}
