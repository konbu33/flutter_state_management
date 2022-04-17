class HomePageState {
  const HomePageState({
    this.counter = 0,
    this.title = "Provider + StateNotifier",
    this.message = "counter is : ",
  });
  final int counter;
  final String title;
  final String message;

  HomePageState copyWith(int counter) {
    return HomePageState(counter: counter);
  }
}
