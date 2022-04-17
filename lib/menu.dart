import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    hide ChangeNotifierProvider;
import 'package:provider/provider.dart';
import 'menu_state.dart';
import 'statelesswidget/home_page.dart' as stateless;
import 'statefulwidget/home_page.dart' as stateful;
import 'inheritedwidget/home_page.dart' as inherited;
import 'bloc/home_page.dart' as bloc;
import 'provider_change_notifer/home_page.dart' as provider_ch;
import 'provider_state_notifier/screen/home_page.dart' as provider_st;
import 'riverpod/screen/home_page.dart' as riverpod;
import 'riverpod_consumer_stateful_widget/home_page.dart' as riverpod_co;

class MenuWidget extends StatelessWidget {
  MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MenuState(),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: Text(context.watch<MenuState>().selectedValue),
          actions: [
            PopupMenuWidget(),
          ],
        ),
        body: NavigatorWidget(),
      ),
    );
  }
}

class NavigatorWidget extends StatelessWidget {
  const NavigatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, result) {
        print("route : $route, result : $result");
        if (!route.didPop(result)) return false;
        return true;
      },
      pages: [
        MaterialPage(
          child: Container(
            child: Text(context.watch<MenuState>().selectedValue),
          ),
        ),
        if (context.watch<MenuState>().selectedValue == 'StatelessWidget')
          MaterialPage(child: stateless.HomePage()),
        if (context.watch<MenuState>().selectedValue == 'StatefulWidget')
          MaterialPage(child: stateful.HomePage()),
        if (context.watch<MenuState>().selectedValue == 'InheritedWidget')
          MaterialPage(child: inherited.HomePage()),
        if (context.watch<MenuState>().selectedValue == 'Bloc')
          MaterialPage(child: bloc.HomePage()),
        if (context.watch<MenuState>().selectedValue ==
            'Provider_Change_Notifier')
          MaterialPage(child: provider_ch.HomePage()),
        if (context.watch<MenuState>().selectedValue ==
            'Provider_State_Notifier')
          MaterialPage(child: provider_st.HomePage()),
        if (context.watch<MenuState>().selectedValue == 'Riverpod')
          MaterialPage(child: ProviderScope(child: riverpod.HomePage())),
        if (context.watch<MenuState>().selectedValue ==
            'Riverpod_Consumer_StatefulWidget')
          MaterialPage(child: ProviderScope(child: riverpod_co.HomePage())),
      ],
    );
  }
}

class PopupMenuWidget extends StatelessWidget {
  const PopupMenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      initialValue: context.watch<MenuState>().selectedValue,
      onSelected: (s) {
        print("onSelected : ${s}");
        context.read<MenuState>().updateSelectedValue(s as String);
      },
      itemBuilder: (context) {
        return context
            .read<MenuState>()
            .menuList
            .map(
              (item) => PopupMenuItem(
                child: Text("${item}"),
                value: item,
              ),
            )
            .toList();
      },
    );
  }
}
