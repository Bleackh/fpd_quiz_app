import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpd_quiz_app/presentation/page/main_page.dart';
import 'package:fpd_quiz_app/presentation/page/onboarding_page.dart';
import 'package:fpd_quiz_app/color/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

int introduction = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  );
  await initIntroduction();
  runApp(const MyApp());
}

Future initIntroduction() async {
  final prefs = await SharedPreferences.getInstance();

  int? intro = prefs.getInt('Introduction');
  if (intro != null && intro == 1) {
    return introduction = 1;
  }
  prefs.setInt('Introduction', 1);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: buildMaterialColor(const Color(0xFF001D6E)),
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          headline1: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      // Pemilihan pemanggilan page (akan langsung ke MainPage apababila sudah pernah melewati OnBoardingPage)
      home: introduction == 0
          ? const OnBoardingPage(title: 'Introduction')
          : const MainPage(),
    );
  }
}
