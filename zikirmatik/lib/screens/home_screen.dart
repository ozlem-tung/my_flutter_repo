import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() => _counter++);
  }

  void _resetCounter() {
    setState(() => _counter = 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191919),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/image/zikirmatik.png', width: 300),
                Positioned(
                  top: 46,
                  right: 80,
                  child: counterText(counter: _counter),
                ),
                Positioned(
                  bottom: 30,
                  child: _incrementButton(onPressed: _incrementCounter),
                ),
                Positioned(
                  right: 76,
                  bottom: 114,
                  child: _resetBotton(onPressed: _resetCounter),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _resetBotton extends StatelessWidget {
  final VoidCallback onPressed;
  const _resetBotton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  onPressed,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(60)),
      ),
    );
  }
}

class _incrementButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _incrementButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  onPressed,
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(60)),
      ),
    );
  }
}

class counterText extends StatelessWidget {
  final int counter;
  const counterText({required this.counter, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$counter',
      style: const TextStyle(
        fontFamily: 'digital7',
        fontSize: 50,
        color: Colors.white,
      ),
    );
  }
}
