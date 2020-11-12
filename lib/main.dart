import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'widgetassets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: preState(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class preState extends StatefulWidget {
  @override
  _preStateState createState() => _preStateState();
}

class _preStateState extends State<preState> {
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return errorLoading();
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return SplashScreen();
    }

    return HomePage();
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(
  //       Duration(seconds: 3),
  //       () => Navigator.of(context).pushReplacement(
  //           MaterialPageRoute(builder: (BuildContext context) => HomePage())));
  // }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double screenHeight(BuildContext context, {double mulBy = 1}) {
    return screenSize(context).height * mulBy;
  }

  double screenWidth(BuildContext context, {double mulBy = 1}) {
    return screenSize(context).width * mulBy;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight(context, mulBy: 0.45),
            ),
            CupertinoActivityIndicator(),
            SizedBox(
              height: 20,
            ),
            mainLogo(),
          ],
        ),
      ),
    );
  }
}

class errorLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          color: Colors.red,
        ),
        Text(
          " Something went wrong",
          style: TextStyle(fontSize: 15),
        ),
      ],
    ));
  }
}
