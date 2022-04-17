import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// statelesswidget
// import 'statelesswidget/home_page.dart';

// statefulwidget
// import 'statefulwidget/home_page.dart';

// inheritedwidget
// import 'inheritedwidget/home_page.dart';

// bloc
// import 'bloc/home_page.dart';

// provider
// import 'provider_change_notifer/home_page.dart';
// import 'provider_state_notifier/screen/home_page.dart';

// riverpod
// import 'riverpod_consumer_stateful_widget/home_page.dart';
// import 'riverpod_consumer_stateful_widget/sub_page.dart';

// import 'riverpod/screen/home_page.dart';

import 'menu.dart';

void main() {
  // runApp(ProviderScope(child: const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // StatelessWidget
      // home: HomePage(),

      // StatefulWidget
      // home: HomePage(),

      // inheritedwidget
      // home: HomePage(),

      // bloc
      // home: HomePage(),

      // provider
      // home: HomePage(),

      // riverpod
      // home: ProviderScope(child: HomePage()),
      // home: SubPage(),

      home: MenuWidget(),
    );
  }
}
