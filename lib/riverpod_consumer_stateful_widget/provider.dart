import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleProvider = Provider<String>(
  (ref) {
    print("call titleProvidr ref : ${ref}");
    return 'Riverpod Demo Page';
  },
);

final subPageTitleProvider = Provider<String>(
  (ref) {
    return 'Sub Page';
  },
);

final messageProvider = Provider<String>(
  (ref) {
    print("call messageProvidr ref : ${ref}");
    return 'You have pushed the button this many times:';
  },
);

final countProvider = StateProvider<int>(
  (ref) {
    print("call countProvidr ref : ${ref}");
    return 0;
  },
);

final selectedPageProvider = StateProvider<String>(
  (ref) {
    print("ref : $ref");
    return 'default';
  },
);

// final subPageProvider =
    // StateNotifierProvider<SubPageStateNotifier, SubPageState>(
        // (ref) => SubPageStateNotifier());
