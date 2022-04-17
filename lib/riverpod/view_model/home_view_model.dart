// import 'package:state_notifier/state_notifier.dart';
import 'package:riverpod/riverpod.dart';
import '/riverpod/state/home_state.dart';

class HomePageStateNotifier extends StateNotifier<HomePageState> {
  HomePageStateNotifier() : super(const HomePageState());

  void increment() {
    state = state.copyWith(state.counter + 1);
  }

  void rebuild() {
    state = const HomePageState();
  }
}
