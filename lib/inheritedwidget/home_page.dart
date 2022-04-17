import 'package:flutter/material.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageState homePageState = HomePageState();

  @override
  Widget build(BuildContext context) {
    print("HomePage rebuild");

    void rebuild() {
      setState(() {});
    }

    return MyInheritedWidget(
      data: homePageState,
      counter: homePageState.counter,
      child: Scaffold(
        appBar: AppBar(
          title: TitleWidget(),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              MessageWidget(),
              CounterWidget(),
            ],
          ),
        ),
        floatingActionButton: IncrementWidget(rebuild: rebuild),
      ),
    );
  }
}

class IncrementWidget extends StatelessWidget {
  const IncrementWidget({
    Key? key,
    required this.rebuild,
  }) : super(key: key);

  final Function rebuild;
  @override
  Widget build(BuildContext context) {
    print("IncrementWidget rebuild");
    final HomePageState state = MyInheritedWidget.of(context, listen: false);
    return FloatingActionButton(
      onPressed: () {
        state.increment();
        rebuild();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("CounterWidget rebuild");
    final HomePageState state = MyInheritedWidget.of(context, listen: true);
    return Text(
      '${state.counter}',
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
    final String message = MyInheritedWidget.of(context, listen: false).message;
    return Text(message);
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("TitleWidget rebuild");
    final String title = MyInheritedWidget.of(context, listen: false).title;
    return Text(title);
  }
}

class MyInheritedWidget extends InheritedWidget {
  const MyInheritedWidget(
      {Key? key,
      required Widget child,
      required this.data,
      required this.counter})
      : super(key: key, child: child);

  final HomePageState data;
  final int counter;

  static HomePageState of(BuildContext context, {bool listen = true}) {
    if (listen) {
      return (context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>())!
          .data;
    } else {
      return (context
              .getElementForInheritedWidgetOfExactType<MyInheritedWidget>()!
              .widget as MyInheritedWidget)
          .data;
    }
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    print(
        "counter : counter isEven : ${counter.isEven}, isOdd : ${counter.isOdd}");
    return counter.isOdd;
    // TODO: implement updateShouldNotify
    // throw UnimplementedError();
  }
}
