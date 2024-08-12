import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:military1km/common/dart/extension/context_extension.dart';
import 'package:military1km/common/theme/custom_theme.dart';
import 'package:military1km/common/theme/custom_theme_app.dart';
import 'package:military1km/screen/login/s_start.dart';
import 'package:nav/nav.dart';

class App extends ConsumerStatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static const defaultTheme = CustomTheme.dark;
  const App({super.key});

  @override
  ConsumerState<App> createState() => AppState();
}

class AppState extends ConsumerState<App> with Nav, WidgetsBindingObserver {
  @override
  GlobalKey<NavigatorState> get navigatorKey => App.navigatorKey;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomThemeApp(
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: App.navigatorKey,
          theme: context.themeType.themeData,
          home: const StartScreen(),
        );
      }),
    );
  }
}
