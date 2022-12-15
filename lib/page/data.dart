import 'package:quiz/model/question_module.dart';

class QuestionList {
  int _questionNumber = 0;
  final List<QuestionModule> _questionList = [
    QuestionModule(
        'The blue whale is the biggest animal to have ever lived.', true),
    QuestionModule('An ant can lift 1,000 times its body weight.', false),
    QuestionModule(
        'When exiting a cave, bats always go in the direction of the wind.',
        false),
    QuestionModule('It takes a sloth two weeks to digest a meal.', true),
    QuestionModule('The goat is the national animal of Scotland.', false),
    QuestionModule(
        'The largest living frog is the Goliath frog of West Africa.', true),
    QuestionModule('An octopus has seven hearts.', false),
  ];

  void nextQuestion() {
    if (_questionNumber < (_questionList.length - 1)) {
      _questionNumber++;
    }
  }

  String getQuestion() {
    return _questionList[_questionNumber].question;
  }

  bool getAnswer() {
    return _questionList[_questionNumber].answer;
  }
}
