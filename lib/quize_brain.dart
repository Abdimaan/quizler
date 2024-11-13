class Question {
  String questionText;
  bool questionAnswer;

  Question({required this.questionText, required this.questionAnswer});
}

class QuizeBrain {
  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question(
      questionText: 'Dalka somali waxa uu ku yaalaa  qaarada Africa',
      questionAnswer: true,
    ),
    Question(
      questionText: 'midabka dhiiga waa cagaar',
      questionAnswer: false,
    ),
    Question(
      questionText: 'Nabi mohamed nabadgalyo iyo naxariis korkiisa ha ahaato marka uu dhimanayey waxa uu jiray 63 sano',
      questionAnswer: true,
    ),
  ];

  bool isQuizEnd() {
    return _questionNumber >= _questionBank.length - 1;
  }

  void reset() {
    _questionNumber = 0;
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestion() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }
}