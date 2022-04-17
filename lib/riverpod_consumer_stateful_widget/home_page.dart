import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'provider.dart';
import 'sub_page.dart';

class HomePage extends ConsumerStatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    print('HomePage rebuild.');
    return Scaffold(
      appBar: AppBar(
        title: Text(ref.watch(titleProvider)),
        actions: [
          IconButton(
              onPressed: () {
                ref
                    .read(selectedPageProvider.notifier)
                    .update((state) => state = 'sub_page');
              },
              icon: Icon(CupertinoIcons.airplane))
        ],
      ),
      body: Navigator(
        onPopPage: (route, result) {
          if (!route.didPop(result)) return false;
          ref
              .watch(selectedPageProvider.notifier)
              .update((state) => state = 'defalut');
          return true;
        },
        pages: [
          MaterialPage(child: DefaultPageWidget(ref: ref)),
          if (ref.watch(selectedPageProvider) == 'sub_page')
            MaterialPage(child: SubPage()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.watch(countProvider.state).state++;
          // ref.watch(countProvider.notifier).state++;
          ref.read(countProvider.notifier).update((state) => state + 1);
          // ref.watch(countProvider.notifier).update(
          //   (state) {
          //     print("state : ${state}");
          //     return state + 1;
          //   },
          // );
          // print("call countProvider : ${ref.watch(countProvider)}");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class DefaultPageWidget extends StatelessWidget {
  const DefaultPageWidget({
    Key? key,
    required this.ref,
  }) : super(key: key);

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(ref.watch(messageProvider)),
          Text(
            '${ref.watch(countProvider)}',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
