import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_view_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('HomePage rebuild.');
    return ChangeNotifierProvider(
      create: (context) => HomePageState(),
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<HomePageState>(
            builder: (context, state, child) => Row(
              children: [
                Text(state.title),
                child ?? Text("Not Child"),
              ],
            ),
            child: Text(" C "),
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
      ),
    );
  }
}

class IncrementButton extends StatelessWidget {
  const IncrementButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("rebuild Increment");
    final Function increment = context.read<HomePageState>().increment;
    return IconButton(
      onPressed: () {
        increment();
      },
      tooltip: 'Increment',
      icon: const Icon(Icons.add),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("rebuild Counter");
    final int counter = context.watch<HomePageState>().counter;
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
    print("rebuild Message");
    final String message = Provider.of<HomePageState>(context).message;
    return Text(message);
  }
}
