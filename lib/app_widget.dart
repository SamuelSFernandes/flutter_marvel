import 'package:flutter/material.dart';

import 'core/app_themes.dart';
import 'src/ui/details/details_page.dart';
import 'src/ui/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marvel  Characters',
      initialRoute: '/',
      onGenerateRoute: (RouteSettings setting) {
        Widget? page;
        final route = setting.name;
        switch (route) {
          case '/':
            page = const HomePage();
            break;
          case '/details':
            page = const DetailsPage();
            break;
          default:
            null;
            break;
        }
        return MaterialPageRoute(
          builder: (_) => page ?? const HomePage(),
          settings: setting,
        );
      },
      theme: appThemes,
    );
  }
}
