import 'package:flutter/material.dart';

class BurstWidget extends StatefulWidget {
  const BurstWidget({super.key});

  @override
  State<BurstWindow> createState() => _BurstWidgetState();
}

class _BurstWidgetState extends State<BurstWindow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Burst",
          style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              fontFamily: 'Open Sans',
              fontSize: 40
          ),
        ),
      ),
    );
  }
}
