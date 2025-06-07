import 'package:family_color_picker/family_color.dart';
import 'package:family_color_picker/family_color_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _color = ValueNotifier(FamilyColor.values.first);

  @override
  void dispose() {
    _color.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFEFEFE),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: ValueListenableBuilder(
              valueListenable: _color,
              builder: (context, color, child) {
                return FamilyColorPicker(
                  value: color,
                  onChanged: (color) {
                    setState(() {
                      _color.value = color;
                    });
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
