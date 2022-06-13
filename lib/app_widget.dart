import 'package:flutter/material.dart';

import 'src/ui/details/details_page.dart';
import 'src/ui/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
          builder: (_) => page!,
          settings: setting,
        );
      },
      theme: ThemeData(
        fontFamily: 'badaboom',
        primaryColor: Colors.black,
        textTheme: const TextTheme(
          headline3: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 20,
              fontFamily: 'heycomic'),
          subtitle2: TextStyle(
            color: Colors.white,
            fontFamily: 'badaboom',
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF202020),
          centerTitle: true,
        ),
      ),
    );
  }
}
