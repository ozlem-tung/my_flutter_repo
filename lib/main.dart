import 'package:color_selection_project/pages/color_picker_page.dart';
import 'package:color_selection_project/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: ColorPickerPage(),
    );
  }
}
