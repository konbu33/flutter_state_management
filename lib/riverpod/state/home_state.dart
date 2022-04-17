class HomePageState {
  const HomePageState({
    this.counter = 0,
    this.title = "Riverpod",
    this.message = "counter is : ",
  });
  final int counter;
  final String title;
  final String message;

  HomePageState copyWith(int counter) {
    return HomePageState(counter: counter);
  }
}
