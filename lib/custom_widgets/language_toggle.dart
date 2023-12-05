import 'package:freo_task/global/global.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class LanguageToggle extends StatefulWidget {
  const LanguageToggle({super.key});

  @override
  State<LanguageToggle> createState() => _LanguageToggleState();
}

class _LanguageToggleState extends State<LanguageToggle> {
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
                  colors: [Colors.deepPurple,Colors.pink],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
            Positioned.fill(
                child: ValueListenableBuilder(
                    valueListenable: lang,
                    builder: (context, value, child) {
                      return Center(
                          child: Text(
                        lang.value == "en" ? "ENG" : "HIN",
                        textAlign: TextAlign.center,
                      ));
                    }))
          ],
        ),
      ),
    );
  }

  void toggle() async {
    {
      if (lang.value == "en") {
        lang.value = "hi";
      } else {
        lang.value = "en";
      }
      sharedPreferences!.setString('lang', lang.value);
      Fluttertoast.showToast(msg: "Language preference saved successfully",toastLength: Toast.LENGTH_SHORT);
    }
  }
}
