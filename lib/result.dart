import 'package:flutter/material.dart';

class OutputScreen extends StatefulWidget {
  const OutputScreen({Key? key, required this.prediction}) : super(key: key);
  final String prediction;
  @override
  State<OutputScreen> createState() => _OutputScreenState();
}

class _OutputScreenState extends State<OutputScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
          height: size.height,
          width: size.width,
          color: Colors.black,
          child: Center(
            child: Text(
              widget.prediction,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
