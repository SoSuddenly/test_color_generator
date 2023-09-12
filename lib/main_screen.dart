import 'package:flutter/material.dart';

import 'package:test_color_generator/color_generator.dart';

/// Called for displaying our page.
class MainScreen extends StatelessWidget {
  /// Doesn't change after initialization.
  const MainScreen();

  /// static title used in the AppBar.
  static const String appBarName = 'Color Generator';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: appBarName),
    );
  }
}

/// Our stateful widget used to redraw only some widgets when we set state.
class MyHomePage extends StatefulWidget {
  /// Constructor of the class.
  const MyHomePage({required this.title});

  /// The title used in the AppBar.
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _backgroundColor = Colors.white;

  ///changes the background color when tapping on the screen
  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = getRandomBackgroundColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(
          child:
              Text(widget.title, softWrap: true, textAlign: TextAlign.center),
        ),
      ),
      body: GestureDetector(
        onTap: _changeBackgroundColor,
        child: ColoredBox(
          color: _backgroundColor, // Update the background color
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Hello there',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
