import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

Future<void> main(List<String> args) async {
  final cubit = CounterCubit();
  print(cubit.state); //Should print 0 initial state

  cubit.increment(); // increment function called
  print(cubit.state); //should print 1

  cubit.increment();
  print(cubit.state); //should print 2

  cubit.decrement();
  print(cubit.state); //should print 1
  cubit.close();
}
