import 'package:freo_task/provider/result_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'global/global.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  cacheDirectory = (await getTemporaryDirectory()).path;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ResultProvider(),
      child: MaterialApp(
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        title: 'Wikify',
        home: MyCustomSplashScreen(),
      ),
    );
  }
}
