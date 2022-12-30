import 'package:custom_date_time_picker/custom_date_time_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Date Time Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Custom Date Time Picker'),
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
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text(
                "Show Date Picker",
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {},
            ),
            ElevatedButton(
              child: const Text(
                "Show Time Picker",
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                CustomDateTimePicker.showCustomTimePicker(context, (p0) => null);
              },
            )
          ],
        ),
      ),
    );
  }
}
