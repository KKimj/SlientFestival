
import 'package:flutter/material.dart';
import 'package:slientfestival/src/pages/detail_page.dart';
import 'package:slientfestival/src/pages/home_page.dart';
import 'package:slientfestival/src/pages/splash_page.dart';
import 'package:slientfestival/src/widgets/coustom_route.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => SplashPage(),
      '/HomePage': (_) => HomePage(),
    };
  }

  static Route onGenerateRoute(RouteSettings settings) {
    final List<String> pathElements = settings.name.split('/');
    if (pathElements[0] != '' || pathElements.length == 1) {
      return null;
    }
    switch (pathElements[1]) {
      case "DetailPage":
        return CustomRoute<bool>(
            builder: (BuildContext context) => HomePage());
//            builder: (BuildContext context) => DetailPage(model: settings.arguments,));
    }
  }
}
