import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<Test> {
  final _questions = const [
    {
      'questionText': 'Pertanyaan 1. Kelas amphibi yang mencakup katak dan kodok adalah?',
      'answers': [
        {'text': 'Salamander', 'score': -2},
        {'text': 'Newts', 'score': -2},
        {'text': 'Anurans', 'score': 10}, // Jawaban yang benar
        {'text': 'Caecilians', 'score': -2},
      ],
    },
    {
      'questionText': 'Pertanyaan 2. Yang mana dari berikut ini BUKAN ordo amphibi?',
      'answers': [
        {'text': 'Gymnophiona', 'score': -2},
        {'text': 'Caudata', 'score': -2},
        {'text': 'Lissamphibia', 'score': 10}, // Jawaban yang benar
        {'text': 'Anura', 'score': -2},
      ],
    },
    {
      'questionText': 'Pertanyaan 3. Istilah untuk proses transformasi dari larva air ke amphibi dewasa adalah?',
      'answers': [
        {'text': 'Metamorfosis', 'score': 10}, // Jawaban yang benar
        {'text': 'Molting', 'score': -2},
        {'text': 'Amplifikasi', 'score': -2},
        {'text': 'Evolusi', 'score': -2},
      ],
    },
    {
      'questionText': 'Pertanyaan 4. Amphibi yang dikenal dengan penampilan tanpa kaki seperti ular adalah?',
      'answers': [
        {'text': 'Katak', 'score': -2},
        {'text': 'Kodok', 'score': -2},
        {'text': 'Salamander', 'score': -2},
        {'text': 'Caecilian', 'score': 10}, // Jawaban yang benar
      ],
    },
    {
      'questionText': 'Pertanyaan 5. Organ pernapasan utama amphibi adalah?',
      'answers': [
        {'text': 'Paru-paru', 'score': -2},
        {'text': 'Insang', 'score': -2},
        {'text': 'Kulit', 'score': 10}, // Jawaban yang benar
        {'text': 'Trakea', 'score': -2},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          SizedBox(height: 20,),
            Padding(
                padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
                child: Container(
                  width: double.maxFinite,
                  height: 70.0,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Center(
                      child: Text(
                        "Test",
                        style: TextStyle(fontSize: 30, color: Colors.orange),
                      )),
                ),
              ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: _questionIndex < _questions.length
                ? Quiz(
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                    questions: _questions,
                  )
                : Result(_totalScore, _resetQuiz),
          ),
        ],
      ),
      
    );
  }
}

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    required this.questions,
    required this.questionIndex,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          questions[questionIndex]['questionText'] as String,
          style: TextStyle(fontSize: 24),
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return ElevatedButton(
            onPressed: () => answerQuestion(answer['score'] as int),
            child: Text(answer['text'] as String),
          );
        }).toList(),
      ],
    );
  }
}

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetHandler;

  Result(this.totalScore, this.resetHandler);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Your Score: $totalScore',
          style: TextStyle(fontSize: 36),
        ),
        ElevatedButton(
          onPressed: () => resetHandler(),
          child: Text('Restart Quiz'),
        ),
      ],
    );
  }
}

