

import 'models/question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('Les sèche-mains sont-ils efficaces pour tuer le nouveau coronavirus?', false),
    Question('Une lampe de désinfection aux ultraviolets peut-elle tuer le nouveau coronavirus?', false),
    Question('Est-ce que une longue exposition au soleil tue le nouveau coronavirus', true),
    Question('Les scanners thermiques peuvent-ils détecter les personnes infectées par le nouveau coronavirus mais ne présentant encore aucun symptôme?', false),
    Question('Les vaccins contre la pneumonie vous protègent-ils contre le nouveau coronavirus?', false),
    Question('Un rinçage régulier du nez avec une solution saline peut-il aider à prévenir l\'infection par le nouveau coronavirus?', false),
    Question('La consommation d\'ail peut-elle aider à prévenir l\'infection par le nouveau coronavirus?', false),
    Question('Est ce que le nouveau coronavirus se propage dans l\'air?', false),
    Question('Le nouveau coronavirus affecte-t-il uniquement les personnes âgées?', false),
    Question('Les antibiotiques sont-ils efficaces pour prévenir et traiter le nouveau coronavirus?', false),
    Question('Puis-je attraper le coronavirus de mon animal de compagnie?', true)
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished()
  {
    if(_questionNumber == _questionBank.length - 1)
    {
      return true;
    }
    else
    {
      return false;
    }
  }

  reset()
  {
    _questionNumber = 0;
  }
}