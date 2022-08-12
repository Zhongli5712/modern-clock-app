import 'package:flutter/material.dart';
import 'package:modern_clock_app/burst.dart';

class BurstWidget extends StatefulWidget {
  const BurstWidget({super.key});

  @override
  State<BurstWidget> createState() => _BurstWidgetState();
}

class _BurstWidgetState extends State<BurstWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Burst",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              fontFamily: 'Open Sans',
              fontSize: 40
          ),
        ),
        backgroundColor: const Color(0xFF2D2D2D),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: const Text("burst"),
        ),
      ),
    );
  }
}
