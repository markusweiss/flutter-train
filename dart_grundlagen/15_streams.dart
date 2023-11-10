import 'dart:async';

void main() {
  Stream<int> numberStream = NumberGenerator().getStream.asBroadcastStream();
  StreamSubscription<int>? sub1; // Initialize it as nullable

  sub1 = numberStream.listen((event) {
    print("sub 1:  $event");
    if (event >= 5) {
      sub1!.pause(); // Use the non-nullable assertion operator (!)
    }
  });

  StreamSubscription sub2 = numberStream.listen((event) {
    print("sub 2:  $event");
  });

  NumberGenerator numberGenerator = NumberGenerator();
  StreamSubscription<int> subscription = numberGenerator.getStream.listen(
    (counter) {
      print(counter);
    },
    onError: (error) {
      print("Fehler");
    },
    onDone: () {
      print("fertig!");
    },
  );
}

class NumberGenerator {
  int _counter = 0;

  StreamController<int> _controller = StreamController<int>();

  Stream<int> get getStream => _controller.stream;

  NumberGenerator() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      _controller.sink.add(_counter);
      _counter++;
    });
  }
}
