import 'package:flutter/material.dart';
import 'package:flutter_collapse_widget/collapse_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter collaspe Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'collaspe Demo  '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Container(
                  color: Colors.greenAccent,
                  child: Flutter_Expandable(
                    firstLayerWidget: Container(child: Text('First Layer')),
                    secondLayerWidgets: [
                      Container(
                          color: Colors.blue, child: Text('Second Layer 1')),
                      Container(
                          color: Colors.blue, child: Text('Second Layer 2')),
                      Container(
                          color: Colors.blue, child: Text('Second Layer 3')),
                    ],
                    isExpandedByDefault: true,
                  ),
                ),
                Container(
                  color: Colors.yellowAccent,
                  child: Flutter_Expandable(
                    firstLayerWidget: Container(child: Text('First Layer2')),
                    secondLayerWidgets: [
                      Container(
                          color: Colors.blue, child: Text('Second Layer 1')),
                      Container(
                          color: Colors.blue, child: Text('Second Layer 2')),
                      Container(
                          color: Colors.blue, child: Text('Second Layer 3')),
                    ],
                    isExpandedByDefault: true,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
