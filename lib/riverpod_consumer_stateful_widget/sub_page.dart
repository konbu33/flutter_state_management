import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'provider.dart';

class SubPage extends StatelessWidget {
  SubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Scaffold(
        appBar: AppBar(
          title: Consumer(
            builder: (context, ref, child) {
              return Text(ref.watch(subPageTitleProvider));
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MessageWidget(),
              CounterWidget(),
              IncrementButton(),
            ],
          ),
        ),
//        floatingActionButton: FloatingActionButton(
//          onPressed: () {
//            ref.read(countProvider.notifier).update((state) => state + 1);
//          },
//          tooltip: 'Increment',
//          child: const Icon(Icons.add),
//        ),
      ),
    );
  }
}

class IncrementButton extends ConsumerWidget {
  const IncrementButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    // final increment =
    // ref.read(countProvider.notifier).update((state) => state + 1);
    final increment = ref.read(countProvider.notifier);
    return ElevatedButton(
        onPressed: () {
          increment.update((state) => state + 1);
        },
        child: Text("increment"));
  }
}

class CounterWidget extends ConsumerWidget {
  const CounterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counter = ref.watch(countProvider);
    return Text(
      '${counter}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class MessageWidget extends ConsumerWidget {
  const MessageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String message = ref.read(messageProvider);
    return Text("message: ${message}");
  }
}
