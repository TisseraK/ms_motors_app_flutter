import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ms_motors_app_flutter/firebase_options.dart';
import 'package:ms_motors_app_flutter/screen/homeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class FadeRoute<T> extends MaterialPageRoute<T> {
  FadeRoute({required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return new FadeTransition(opacity: animation, child: child);
  }
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return FadeRoute(
          builder: (_) => HomeScreen(),
        );

      default:
        return FadeRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('ERROR')),
                ));
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MsMotors.FR',
        theme: ThemeData(
          fontFamily: 'Raleway',
          primarySwatch: Colors.purple,
        ),
        debugShowMaterialGrid: false,
        initialRoute: '/home',
        onGenerateRoute: Router.generateRoute,
        debugShowCheckedModeBanner: false);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'EEEE',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
