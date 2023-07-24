import 'package:battery_level/DeviceModelMakePlugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _modelMake = '';
  Future<void> _getModelMake() async {
    String makeModelResult;
    try {
      final String result = await DeviceModelMakePlugin.modelMake;
      makeModelResult = result;
    } on PlatformException catch (e) {
      makeModelResult = "Failed to get Model & Make: '${e.message}'.";
    }
    if (!mounted) {
      return;
    }
    setState(() {
      _modelMake = makeModelResult;
    });
  }

  @override
  void initState() {
    super.initState();
    _getModelMake();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: Text(_modelMake)),
    );
  }
}
