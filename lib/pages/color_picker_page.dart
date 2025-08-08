import 'dart:math';
import 'package:color_selection_project/contants/colors.dart';
import 'package:color_selection_project/widgets/color_display.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({super.key});
  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  Color selectedColor = Colors.blue;
  bool isCircular = false;
  bool isColorShowName = false;

  void _randomSelectedColor() {
    final color = colors.keys.toList();

    final random = Random().nextInt(color.length);
    final randomColor = color[random];

    setState(() {
      selectedColor = randomColor;
    });
  }

  void showColorCode() {
    Fluttertoast.showToast(
      msg:
          "RGB: (${(selectedColor.r * 255).round()}, ${(selectedColor.g * 255).round()}, ${(selectedColor.b * 255).round()})",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: selectedColor,
      textColor: Colors.white,
      fontSize: 24,
    );
  }

  void _changeModel() {
    setState(() {
      isCircular = !isCircular;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('color picker'),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                isColorShowName = !isColorShowName;
              });
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'Ali',
                  child: Row(
                    children: [
                      Icon(
                        isColorShowName
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 20,
                        color: Colors.black54,
                      ),
                      SizedBox(width: 8),
                      Text('Show/Hide color name!  '),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              colorDisplay(
                selectedColor: selectedColor,
                isCircular: isCircular,
              ),

              SizedBox(height: 10),
              isColorShowName
                  ? SizedBox()
                  : Text(colors[selectedColor] ?? 'Selected Color'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButton<Color>(
                      value: selectedColor,
                      items: colors.entries.map((entry) {
                        return DropdownMenuItem(
                          value: entry.key,
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                color: entry.key,
                              ),
                              SizedBox(width: 15),
                              Text(entry.value),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedColor = value!;
                        });
                      },
                    ),

                    ElevatedButton(
                      onPressed: _randomSelectedColor,
                      child: Text(
                        'Random',
                        style: TextStyle(color: selectedColor),
                      ),
                    ),
                    IconButton(
                      onPressed: showColorCode,
                      icon: Icon(Icons.info),
                    ),
                    IconButton(
                      onPressed: () {
                        _changeModel();
                      },
                      icon: Icon(
                        isCircular
                            ? Icons.square_outlined
                            : Icons.circle_outlined,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
