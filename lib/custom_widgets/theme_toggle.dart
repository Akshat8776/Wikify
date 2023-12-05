import 'package:freo_task/enums/theme.dart';
import 'package:freo_task/global/global.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class ThemeToggle extends StatefulWidget {
  const ThemeToggle({super.key});

  @override
  State<ThemeToggle> createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<ThemeToggle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          toggle();
        },
        child: Stack(
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0xDDFF0080),
                    Color(0xDDFF8C00),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
            Positioned.fill(
                child: ValueListenableBuilder(
                    valueListenable: globaltheme,
                    builder: (context, value, child) {
                      return Icon(
                        globaltheme.value == Themes.LIGHT
                            ? Icons.sunny
                            : Icons.shield_moon,
                      );
                    }))
          ],
        ),
      ),
    );
  }

  void toggle() async {
    {
      // print(globaltheme);
      if (globaltheme.value == Themes.LIGHT) {
        globaltheme.value = Themes.DARK;
        col.value = Colors.black;
      } else {
        globaltheme.value = Themes.LIGHT;
        col.value = Colors.white;
      }
      sharedPreferences!
          .setString('theme', globaltheme.value.toString().split('.')[1]);
      Fluttertoast.showToast(msg: "Theme preference saved successfully",toastLength: Toast.LENGTH_SHORT);
    }
  }
}
