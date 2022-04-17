import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/riverpod/state/home_state.dart';
import '/riverpod/view_model/home_view_model.dart';

final homePageProvider =
    StateNotifierProvider<HomePageStateNotifier, HomePageState>(
        (ref) => HomePageStateNotifier());

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('HomePage rebuild.');
    return Scaffold(
      appBar: AppBar(
        title: TitleWidget(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            MessageWidget(),
            CounterWidget(),
            IncrementWidget(),
          ],
        ),
      ),
    );
  }
}

class IncrementWidget extends ConsumerWidget {
  const IncrementWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Function increment = ref.read(homePageProvider.notifier).increment;
    return FloatingActionButton(
      onPressed: () {
        increment();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class CounterWidget extends ConsumerWidget {
  const CounterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counter = ref.watch(homePageProvider).counter;

    return Text(
      '$counter',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class MessageWidget extends ConsumerStatefulWidget {
  const MessageWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends ConsumerState<MessageWidget> {
  @override
  Widget build(BuildContext context) {
    final String message = ref.watch(homePageProvider).message;
    return Text("$message");
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final String title = ref.read(homePageProvider).title;
        return Text("${title}");
      },
    );
  }
}
