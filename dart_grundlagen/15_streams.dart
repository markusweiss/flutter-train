import 'dart:async';

void main() {
  Stream<int> numberStream = NumberGenerator().getStream.asBroadcastStream();
  StreamSubscription<int>? sub1;
  StreamSubscription<int>? sub2;

  sub1 = numberStream.listen((event) {
    print("sub 1:  $event");
    if (event == 3) {
      sub1!.pause();
    }
    if (event >= 10) {
      sub1?.cancel();
    }
  });

  sub2 = numberStream.listen((event) {
    print("sub 2:  $event");
    if (event >= 7) {
      sub1?.resume();
    }
    if (event >= 10) {
      sub2?.cancel();
    }
  });

  NumberGenerator numberGenerator = NumberGenerator();
  StreamSubscription<int> subscription = numberGenerator.getStream.listen(
    (counter) {
      print("-------------");
    },
    onError: (error) {
      print("Fehler");
    },
    onDone: () {
      print("fertig!");
    },
  );

  Future.delayed(Duration(seconds: 11), () {
    sub1?.cancel(); // Falls noch nicht abgebrochen
    sub2?.cancel();
    subscription.cancel();
    numberGenerator.getStreamController.close();
  });
}

class NumberGenerator {
  int _counter = 0;
  late StreamController<int> _controller;

  Stream<int> get getStream => _controller.stream;
  StreamController<int> get getStreamController => _controller;

  NumberGenerator() {
    _controller = StreamController<int>();

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (!_controller.isClosed) {
        _controller.sink.add(_counter);
        _counter++;
      }
    });
  }
}
