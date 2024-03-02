part of 'counter_cubit.dart';


class CounterInitial extends Equatable {
  final int counterValue;
  const CounterInitial(this.counterValue);
  @override
  List<Object?> get props => [counterValue];
  @override
  String toString() {
    // TODO: implement toString
    return '${super.toString()}, CounterInitial(counterValue: $counterValue';
  }
}
