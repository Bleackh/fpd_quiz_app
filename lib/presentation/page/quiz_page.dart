import 'package:flutter/material.dart';
import 'package:fpd_quiz_app/data/model/question_model.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= 768) {
          return const WebQuizPage();
        } else {
          return const MobileQuizPage();
        }
      },
    );
  }
}

List<Question> questionList = getQuestions();
int currentQuestionIndex = 0;
int score = 0;
Answer? selectedAnswer;

class MobileQuizPage extends StatefulWidget {
  const MobileQuizPage({Key? key}) : super(key: key);

  @override
  State<MobileQuizPage> createState() => _MobileQuizPageState();
}

class _MobileQuizPageState extends State<MobileQuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF084594),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Pertanyaan ${currentQuestionIndex + 1}/${questionList.length.toString()}',
                  style: const TextStyle(fontSize: 28),
                ),
                const Divider(
                  thickness: 1.5,
                  color: Colors.white,
                ),
                const SizedBox(height: 30.0),
                //Memanggil List Soal
                _questionList(),
                const SizedBox(height: 25.0),
                //Memanggil List Jawaban
                _answerList(),
                const SizedBox(height: 25.0),
                //Memanggil Soal Berikutnya
                _nextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Penambahan dan Pengaturan List Soal
  _questionList() {
    return Column(children: [
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(30.0),
        decoration: const BoxDecoration(
          color: Color(0xFFFF7700),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Center(
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    ]);
  }

  //Penambahan dan Pengaturan List Jawaban
  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answerList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  //Pemilihan Jawaban
  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 15),
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.black,
          backgroundColor: isSelected ? Colors.grey.shade600 : Colors.white,
          shape: const StadiumBorder(),
        ),
        onPressed: () {
          if (selectedAnswer == null) {
            if (answer.isCorrect) {
              score++;
            }
            setState(() {
              selectedAnswer = answer;
            });
          }
        },
        child: Text(answer.answerText),
      ),
    );
  }

  //Soal Berikutnya
  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          margin: const EdgeInsets.only(top: 10),
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.grey.shade600,
              shape: const StadiumBorder(),
            ),
            onPressed: () {
              if (isLastQuestion) {
                showDialog(
                    context: context, builder: (context) => _showScore());
              } else {
                setState(
                  () {
                    selectedAnswer = null;
                    currentQuestionIndex++;
                  },
                );
              }
            },
            child: Text(isLastQuestion ? 'Selesai' : 'Selanjutnya'),
          ),
        ),
      ],
    );
  }

  //Menampilkan Skor
  _showScore() {
    bool isPassed = false;

    if (score >= questionList.length * 0.7) {
      isPassed = true;
    }
    String title = isPassed ? 'Selamat Anda Lulus' : 'Maaf Anda Gagal';

    return AlertDialog(
      title: Text('$title Skor Anda Adalah ${score * 100 / 10}'),
      elevation: 24.0,
      content: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        child: const Text('Ulangi Kembali'),
        onPressed: () {
          Navigator.pop(context);
          setState(() {
            currentQuestionIndex = 0;
            score = 0;
            selectedAnswer = null;
          });
        },
      ),
    );
  }
}

class WebQuizPage extends StatefulWidget {
  const WebQuizPage({Key? key}) : super(key: key);

  @override
  State<WebQuizPage> createState() => _WebQuizPageState();
}

class _WebQuizPageState extends State<WebQuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF084594),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Pertanyaan ${currentQuestionIndex + 1}/${questionList.length.toString()}',
                  style: const TextStyle(fontSize: 28),
                ),
                const Divider(
                  thickness: 1.5,
                  color: Colors.white,
                ),
                const SizedBox(height: 60.0),
                //Memanggil List Soal
                _questionList(),
                const SizedBox(height: 25.0),
                //Memanggil List Jawaban
                _answerList(),
                const SizedBox(height: 50.0),
                //Memanggil Soal Berikutnya
                _nextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Penambahan dan Pengaturan List Soal
  _questionList() {
    return Column(children: [
      Container(
        width: MediaQuery.of(context).size.width * 0.65,
        padding: const EdgeInsets.all(30.0),
        decoration: const BoxDecoration(
          color: Color(0xFFFF7700),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Center(
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    ]);
  }

  //Penambahan dan Pengaturan List Jawaban
  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answerList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  //Pemilihan Jawaban
  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      margin: const EdgeInsets.only(top: 30),
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.black,
          backgroundColor: isSelected ? Colors.grey.shade600 : Colors.white,
          shape: const StadiumBorder(),
        ),
        onPressed: () {
          if (selectedAnswer == null) {
            if (answer.isCorrect) {
              score++;
            }
            setState(() {
              selectedAnswer = answer;
            });
          }
        },
        child: Text(answer.answerText),
      ),
    );
  }

  //Soal Berikutnya
  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.20,
          margin: const EdgeInsets.only(top: 10),
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.grey.shade600,
              shape: const StadiumBorder(),
            ),
            onPressed: () {
              if (isLastQuestion) {
                showDialog(
                    context: context, builder: (context) => _showScore());
              } else {
                setState(
                  () {
                    selectedAnswer = null;
                    currentQuestionIndex++;
                  },
                );
              }
            },
            child: Text(isLastQuestion ? 'Selesai' : 'Selanjutnya'),
          ),
        ),
      ],
    );
  }

  //Menampilkan Skor
  _showScore() {
    bool isPassed = false;

    if (score >= questionList.length * 0.7) {
      isPassed = true;
    }
    String title = isPassed ? 'Selamat Anda Lulus' : 'Maaf Anda Gagal';

    return AlertDialog(
      title: Text('$title Skor Anda Adalah ${score * 100 / 10}'),
      elevation: 24.0,
      content: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        child: const Text('Ulangi Kembali'),
        onPressed: () {
          Navigator.pop(context);
          setState(() {
            currentQuestionIndex = 0;
            score = 0;
            selectedAnswer = null;
          });
        },
      ),
    );
  }
}
