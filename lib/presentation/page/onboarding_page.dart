import 'package:flutter/material.dart';
import 'package:fpd_quiz_app/presentation/page/main_page.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= 768) {
          //Perubahan Apabila Sama Dengan Lebar Besar Layar 768px (Layar Website)
          return const OnBoardingWebPage();
        } else {
          //Default (Layar Handphone)
          return const OnBoardingMobilePage();
        }
      },
    );
  }
}

//Mengatur Gambar, dan lokasi
Widget _buildImage(String assetName, [double width = 350]) {
  return Image.asset('assets/$assetName', width: width);
}

class OnBoardingMobilePage extends StatefulWidget {
  const OnBoardingMobilePage({Key? key}) : super(key: key);

  @override
  State<OnBoardingMobilePage> createState() => _OnBoardingMobilePage();
}

class _OnBoardingMobilePage extends State<OnBoardingMobilePage> {
  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 19.0),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      globalBackgroundColor: const Color(0xFF084594),
      pages: [
        PageViewModel(
          image: _buildImage('image1.png'),
          title: "Selamat Datang!",
          body:
              "Aplikasi ini merupakan Quiz App yang dimana teman-teman memakai aplikasi ini sebagai media pemelajaran untuk menjawab soal-soal menggunakan jawaban pilihan ganda.",
          decoration: pageDecoration,
        ),
        PageViewModel(
          image: _buildImage('image2.png'),
          title: "Final Project",
          body:
              "Aplikasi ini juga untuk memenuhi Final Project yang diberikan oleh Dicoding.",
          decoration: pageDecoration,
        ),
        PageViewModel(
          image: _buildImage('image3.png'),
          title: "FPD Quiz App",
          body: "Kita langsung mulai saja, Gassskeuunnn.",
          decoration: pageDecoration,
          footer: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (builder) {
                    return const MainPage();
                  },
                ),
              );
            },
            child: const Text(
              'Get Started',
            ),
          ),
        ),
      ],
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (builder) {
              return const MainPage();
            },
          ),
        );
      },
      showSkipButton: false,
      showBackButton: true,
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.bold)),
      next: const Icon(Icons.arrow_forward),
      back: const Icon(Icons.arrow_back),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.bold)),
      dotsFlex: 1,
      nextFlex: 1,
      skipOrBackFlex: 1,
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

class OnBoardingWebPage extends StatefulWidget {
  const OnBoardingWebPage({super.key});

  @override
  State<OnBoardingWebPage> createState() => _OnBoardingWebPageState();
}

class _OnBoardingWebPageState extends State<OnBoardingWebPage> {
  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 19.0),
      bodyPadding: EdgeInsets.all(60),
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      globalBackgroundColor: const Color(0xFF084594),
      pages: [
        PageViewModel(
          image: _buildImage('image1.png'),
          title: "Selamat Datang!",
          body:
              "Aplikasi ini merupakan Quiz App yang dimana teman-teman memakai\naplikasi ini sebagai media pemelajaran untuk menjawab soal-soal menggunakan jawaban pilihan ganda.",
          decoration: pageDecoration,
        ),
        PageViewModel(
          image: _buildImage('image2.png'),
          title: "Final Project",
          body:
              "Aplikasi ini juga untuk memenuhi Final Project yang diberikan oleh Dicoding.",
          decoration: pageDecoration,
        ),
        PageViewModel(
          image: _buildImage('image3.png'),
          title: "FPD Quiz App",
          body: "Kita langsung mulai saja, Gassskeuunnn.",
          decoration: pageDecoration,
          footer: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(100, 40),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (builder) {
                    return const MainPage();
                  },
                ),
              );
            },
            child: const Text(
              'Get Started',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (builder) {
              return const MainPage();
            },
          ),
        );
      },
      showSkipButton: false,
      showBackButton: true,
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.bold)),
      next: const Icon(Icons.arrow_forward),
      back: const Icon(Icons.arrow_back),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.bold)),
      dotsFlex: 1,
      nextFlex: 1,
      skipOrBackFlex: 1,
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
