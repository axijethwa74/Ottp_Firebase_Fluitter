import 'package:flutter/material.dart';

class DasgScreen extends StatefulWidget {
  const DasgScreen({super.key});

  @override
  State<DasgScreen> createState() => _DasgScreenState();
}

class _DasgScreenState extends State<DasgScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: Container(
        height: 100,
        width: 500,
        child: Text("Successfully Verified"),
      ),
    );
  }
}
