//Single subscription stream

import 'dart:async';

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    if (i % 2 == 0) {
      // throw Exception('Received 4 exception');
      yield i++;
    } else {
      yield i;
    }
  }
}

//Broadcast stream
Stream<int> broadcastStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    if (i % 2 == 0) {
      // throw Exception('Received 4 exception');
      yield i++;
    } else {
      yield i;
    }
  }
}

Future<int> firstPositive(Stream<int> stream) =>
    stream.firstWhere((element) => element >= 0);

Future<void> main() async {
  var streamController = StreamController.broadcast();
  streamController.stream.listen((event) {
    print('first subscription $event');
  });
  streamController.stream.listen((event) {
    print('Second subscription ${event + event}');
  });

  //push events to broadcast stream
  streamController.sink.add(1);
  streamController.sink.add(100);

  final counterStream = countStream(10);
  try {
    await for (var value in counterStream) {
      print(value);
    }
  } catch (e) {
    print('Caught error: $e');
  }
  /*firstPositive(
      streamController.stream.listen((event) { })l);  //cant' listen the same stream twice since it is a single subscription stream*/
}
