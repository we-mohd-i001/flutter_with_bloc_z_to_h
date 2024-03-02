part of 'counter_cubit.dart';

class CounterInitial extends Equatable {
  final int counterValue;
  const CounterInitial(this.counterValue);
  @override
  List<Object?> get props => [counterValue];
  @override
  String toString() {
    return '${super.toString()}, CounterInitial(counterValue: $counterValue';
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'counterValue': counterValue,
    };
  }

  factory CounterInitial.fromMap(Map<String, dynamic> map) {
    return CounterInitial(
      map['counterValue'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterInitial.fromJson(String source) =>
      CounterInitial.fromMap(json.decode(source) as Map<String, dynamic>);
}
