import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scattertest/providers/statusprovider.dart';
import 'package:scattertest/screens/homescreen.dart';
import 'package:scattertest/providers/statusprovider.dart';

void main() {
  runApp(const ScatterTest());
}

class ScatterTest extends StatelessWidget {
  const ScatterTest({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => StatusProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Scatter Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen()
      ),
    );
  }
}
