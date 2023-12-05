import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../enums/theme.dart';

ValueNotifier<Themes> globaltheme = ValueNotifier(Themes.LIGHT);
ValueNotifier<Color> col= ValueNotifier(Colors.white);
Color textColor=Colors.purple;
SharedPreferences? sharedPreferences;
var cacheDirectory;
late double maxWidth,maxHeight;
ValueNotifier<String> lang=ValueNotifier("en");