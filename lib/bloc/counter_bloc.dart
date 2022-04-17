import 'dart:async';

class CounterBloc {
  CounterBloc({required this.counter}) {
    print("counterBloc isClosed : ${_sc.isClosed}");
    if (!_sc.isClosed) _sc.sink.add(counter);
  }

  int counter;
  static List<int> numList = [1, 2, 3];
  static StreamController<int> _sc = StreamController();

  static Stream<int> get count => _sc.stream;

  static void prede() {
    DateTime now = DateTime.now();

    Stream<int> a = Stream.periodic(Duration(seconds: 1), (x) => x);
    a.forEach(print);
  }

  void increment() {
    counter++;
    _sc.sink.add(counter);
  }

  void dispose() {
    _sc.close();
  }

  static addNumList(int n) => numList.add(n);

  Stream ydst() async* {
    yield numList;
  }
}
