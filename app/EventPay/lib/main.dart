import 'dart:io';

import 'package:eventpay/screens/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bloc/global/global_bloc.dart';
import 'router/router.dart';
import 'router/routes.dart';
import 'services/auth_service.dart';
import 'services/backend_service.dart';
import 'services/http_service.dart';
import 'util/logger.dart';

void main() {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final Logger logger = Logger();

  final HttpService httpService = HttpService();
  AuthService(httpService: httpService);
  BackendService(httpService: httpService);

  final GlobalBloc globalBloc = GlobalBloc(logger: logger);

  WidgetsFlutterBinding.ensureInitialized();

  runApp(EventPayApp(navigatorKey: navigatorKey));
}

class EventPayApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const EventPayApp({
    Key? key,
    required this.navigatorKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      title: 'EventPay',
      home: EventScreen(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 18.0, fontFamily: 'Hind'),
        ),
      ),
      // initialRoute: EPRoute.initial,
      // onGenerateRoute: EPRouter.onGenerateRoute,
      // navigatorKey: navigatorKey,
    );
  }
}
