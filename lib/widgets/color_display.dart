import 'package:flutter/material.dart';

class colorDisplay extends StatelessWidget {
  const colorDisplay({
    super.key,
    required this.selectedColor,
    required this.isCircular,
  });

  final Color selectedColor;
  final bool isCircular;

  @override
  Widget build(BuildContext context) {
    final devicesSize = MediaQuery.of(context).size;
    debugPrint(devicesSize.toString());
    final containerSize = devicesSize.shortestSide * 0.4;

    return Container(
      width: containerSize,
      height: containerSize,
      decoration: BoxDecoration(
        color: selectedColor,
        borderRadius: BorderRadius.circular(
          isCircular ? containerSize / 2 : 10,
        ),
        boxShadow: [
          BoxShadow(color: selectedColor, blurRadius: 10, spreadRadius: 3),
        ],
      ),
    );
  }
}
