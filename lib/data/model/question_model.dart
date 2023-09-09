import 'dart:core';

class Question {
  final String questionText;
  final List<Answer> answerList;

  Question(this.questionText, this.answerList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];

  list.add(
    Question(
      'Flutter merupakan framework yang bersifat?',
      [
        Answer('Close Source', false),
        Answer('Berbayar', false),
        Answer('Berlisensi', false),
        Answer('Open Source', true),
      ],
    ),
  );

  list.add(
    Question(
      'Fitur yang berada di flutter dimana kodingan kamu bisa langsung muncul di hp maupun di emulator disebut?',
      [
        Answer('Refresh', false),
        Answer('Hot Reload', true),
        Answer('Reload', false),
        Answer('Hot Loading', false),
      ],
    ),
  );

  list.add(
    Question(
      'Widget yang nilai state-nya tidak dapat berubah (immutable) maka widget tersebut lebih bersifat statis dan memiliki interaksi yang terbatas?',
      [
        Answer('Statefull Widget', false),
        Answer('Container', false),
        Answer('Stateless Widget', true),
        Answer('Scaffold', false),
      ],
    ),
  );

  list.add(
    Question(
      'Folder ini merupakan tempat Anda untuk men-setting konfigurasi untuk aplikasi android, di dalamnya terdapat file gradle, AndroidManifest, dan lain-lain?',
      [
        Answer('/lib', false),
        Answer('/android', true),
        Answer('/ios', false),
        Answer('/test', false),
      ],
    ),
  );

  list.add(
    Question(
      'Flutter ditulis menggunakan bahasa pemrograman??',
      [
        Answer('Javascript', false),
        Answer('Dart', true),
        Answer('PHP', false),
        Answer('Python', false),
      ],
    ),
  );

  list.add(
    Question(
      'Flutter merupakan SDK yang dikembangkan oleh??',
      [
        Answer('Google', true),
        Answer('Apple', false),
        Answer('Microsoft', false),
        Answer('Facebook', false),
      ],
    ),
  );

  list.add(
    Question(
      'Aplikasi apakah yang bisa dibuat oleh Flutter?',
      [
        Answer('Mobile (Android dan iOS)', false),
        Answer('Web', false),
        Answer('Desktop', false),
        Answer('Semua Benar', true),
      ],
    ),
  );

  list.add(
    Question(
      'Manakah yang bukan merupakn sebuah Widget?',
      [
        Answer('Text', false),
        Answer('Container', false),
        Answer('Center', false),
        Answer('String', true),
      ],
    ),
  );

  list.add(
    Question(
      'Widget ____ digunakan untuk mengulang konten',
      [
        Answer('Expanded', false),
        Answer('Stack', false),
        Answer('ListView', true),
        Answer('Scaffold', false),
      ],
    ),
  );

  list.add(
    Question(
      'Kapan Flutter pertama kali dikenalkan?',
      [
        Answer('2022', false),
        Answer('2015', true),
        Answer('2018', true),
        Answer('2016', false),
      ],
    ),
  );

  return list;
}
