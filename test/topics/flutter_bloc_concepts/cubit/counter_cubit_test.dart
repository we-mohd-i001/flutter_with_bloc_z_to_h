import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_with_bloc_z_to_h/topics/flutter_bloc_concepts/cubit/counter_cubit.dart';

void main() {
  group('CounterCubit()', () {
    late CounterCubit counterCubit;

    setUp(() => counterCubit = CounterCubit());

    test('initial state is 0',
        () => expect(counterCubit.state, const CounterInitial(0)));

    blocTest(
      'emits 1 when increment() is called once',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect:(){
        return const [CounterInitial(1)];
      } ,
    );

    blocTest(
      'emits -1 when decrement() is called once',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect:(){
        return const [CounterInitial(-1)];
      } ,
    );
    blocTest(
      'emits 10 when increaseTen() is called once',
      build: () => counterCubit,
      act: (cubit) => cubit.increaseTen(),
      expect:(){
        return const [CounterInitial(10)];
      } ,
    );
    blocTest(
      'emits -10 when decreaseTen() is called once',
      build: () => counterCubit,
      act: (cubit) => cubit.decreaseTen(),
      expect:(){
        return const [CounterInitial(-10)];
      } ,
    );

  });
}
