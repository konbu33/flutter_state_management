import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

import '/provider_state_notifier/state/home_state.dart';
import '/provider_state_notifier/view_model/home_view_model.dart';
// import '../provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('HomePage rebuild.');
    return StateNotifierProvider<HomePageStateNotifier, HomePageState>(
      create: (context) => HomePageStateNotifier(),
      child: Scaffold(
        appBar: AppBar(
          title: TitleWidget(),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MessageWidget(),
              CounterWidget(),
              IncrementWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class IncrementWidget extends StatelessWidget {
  const IncrementWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Function increment = context.read<HomePageStateNotifier>().increment;
    // final Function increment = context.read<HomePageStateNotifier>().rebuild;
    print("IncrementWidget rebuild");
    return ElevatedButton(
        onPressed: () {
          increment();
        },
        child: Text("increment"));
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("CounterWidget rebuild");
    final int counter =
        // context.select<HomePageState, int>((state) => state.counter);
        context.watch<HomePageState>().counter;
    return Text(
      '${counter}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("MessageWidget rebuild");
    final String message =
        context.select<HomePageState, String>((state) => state.message);
    return Text("message : ${message}");
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("TitleWidget rebuild");
    final String title = context.read<HomePageState>().title;
    return Text(title);
  }
}
