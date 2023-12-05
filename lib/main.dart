import 'package:freo_task/provider/result_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'global/global.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';
import 'enums/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  String? theme= sharedPreferences!.getString('theme');
  if(theme==null){

    sharedPreferences!.setString('theme', 'LIGHT');
    globaltheme.value=Themes.LIGHT;
  }else {
    globaltheme.value=theme=="LIGHT"?Themes.LIGHT:Themes.DARK;
  }
  String? languagepref= sharedPreferences!.getString('lang');
  if(languagepref==null){
    sharedPreferences!.setString('lang', 'en');
  }
  else {
    lang.value=languagepref;
  }
  col.value=globaltheme.value==Themes.LIGHT?Colors.white:Colors.black;
  cacheDirectory = (await getTemporaryDirectory()).path;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ResultProvider(),
      child: const MaterialApp(
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        title: 'Wikify',
        home: MyCustomSplashScreen(),
      ),
    );
  }
}
