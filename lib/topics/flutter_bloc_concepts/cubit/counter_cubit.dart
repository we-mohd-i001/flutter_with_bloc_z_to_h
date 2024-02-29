import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterInitial> {
  CounterCubit() : super(const CounterInitial(0));

  void increment() => emit(CounterInitial(state.counterValue +1));
  void decrement() => emit(CounterInitial(state.counterValue -1));
  void decreaseTen() => emit(CounterInitial(state.counterValue -10));
  void increaseTen() => emit(CounterInitial(state.counterValue +10));
}
