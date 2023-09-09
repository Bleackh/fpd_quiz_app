import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:fpd_quiz_app/presentation/page/quiz_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= 768) {
          //Perubahan Apabila Sama Dengan Lebar Besar Layar 768px (Layar Website)
          return const WebMainPage();
        } else {
          //Default (Layar Handphone)
          return const MobileMainPage();
        }
      },
    );
  }
}

class MobileMainPage extends StatefulWidget {
  const MobileMainPage({Key? key}) : super(key: key);

  @override
  State<MobileMainPage> createState() => _MobileMainPageState();
}

class _MobileMainPageState extends State<MobileMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF084594),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Info!\nSoal Dalam Aplikasi Quiz ini Akan Mengenai Seputar Pengetahuan Dasar Flutter',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60.0),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const QuizPage();
                  }));
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.info,
                    text:
                        "Pertanyaan Terdiri Dari 10 Soal, dan tidak memiliki batas waktu.\nJawaban hanya bisa di klik sekali.\nEnjoy The Quiz",
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Color(0xFF001D6E),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: const Text(
                    'Mulai Quiz',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WebMainPage extends StatefulWidget {
  const WebMainPage({Key? key}) : super(key: key);

  @override
  State<WebMainPage> createState() => _WebMainPageState();
}

class _WebMainPageState extends State<WebMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF084594),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Info!\nSoal Dalam Aplikasi Quiz ini Mengenai Seputar Pengetahuan Dasar Flutter',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60.0),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const QuizPage();
                    }));
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.info,
                      text:
                          "Pertanyaan Terdiri Dari 10 Soal, dan tidak memiliki batas waktu.\nEnjoy The Quiz",
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      color: Color(0xFF001D6E),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: const Text(
                      'Mulai Quiz',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
