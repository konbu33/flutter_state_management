class HomePageState {
  HomePageState({
    this.counter = 0,
    this.title = "Inherited Widget",
    this.message = "counter is : ",
  });
  int counter;
  final String title;
  final String message;

  HomePageState copyWith(int counter) {
    return HomePageState(counter: counter);
  }

  void increment() {
    counter++;
  }
}
