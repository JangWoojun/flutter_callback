import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Body(),
    ),
  ));
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const TestWidget();
  }
}

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  late int value;

  @override
  void initState() {
    super.initState();
    value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "count: $value",
            style: const TextStyle(fontSize: 60, color: Colors.blue),
          ),
          TestButton(callback: addCount, callback2: addCount2),
        ],
      ),
    );
  }

  void addCount() {
    setState(() => ++value);
  }
  void addCount2(int newValue) {
    setState(() => value += newValue);
  }
}

class TestButton extends StatelessWidget {
  const TestButton({required this.callback, required this.callback2, super.key});

  final VoidCallback callback;
  final Function(int) callback2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback.call(),
      onDoubleTap: () => callback2.call(2),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 42),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(top: 50),
        child: const Text("UP",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            )),
      ),
    );
  }
}
