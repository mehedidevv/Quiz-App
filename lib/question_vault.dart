import 'package:quiz_application/question.dart';

class QuestionVault{
int _questionNumber=0;
  List <Question> _questionset=[

    Question(
        ques: 'Flutter can only develop mobile applications',
        img: "images/flutter.png",
        ans: false),
    Question(
        ques: 'Colombo is the capital of Sri Lanka',
        img: "images/colombo.jpeg",
        ans: true),
    Question(
        ques: 'Cox\'s Bazar is the longest sea beach in the world',
        img: "images/sea-beach.jpeg",
        ans: true),
    Question(
        ques: 'Spanish language has the more native speakers',
        img: "images/spanish.png",
        ans: true),
    Question(
        ques: 'In 1946 the United Nations established',
        img: "images/usa.png",
        ans: false),
    Question(
        ques: 'In Finland drinks the most coffee per capita',
        img: "images/finland.png",
        ans: true),
    Question(
        ques: 'Walt Disney has won two Academy Awards?',
        img: "images/walt_disney.jpeg",
        ans: false),
    Question(
        ques: 'Brazil has won the most World Cups',
        img: "images/brazil.png",
        ans: true),
    Question(
        ques: 'Kratos is the main character of God of War',
        img: "images/god_of_war.jpeg",
        ans: true),
    Question(
        ques: 'We have 5 bones in out ear', img: "images/ear.png", ans: false),

  ];

  //TODO Next Question Method
void nextQuestion(){
  if(_questionNumber<_questionset.length-1){
    _questionNumber++;
  }

}

  //Get Method For Question Tittle
  String setQuestionTittle(){
    return _questionset[_questionNumber].questionTittle;
  }

  // Get Method For Image
  String setImage(){
    return _questionset[_questionNumber].image;
  }

  //Get Method For Answer
  bool setAnswer(){
    return _questionset[_questionNumber].answer;

  }

bool isFinished() {
  if (_questionNumber >= _questionset.length - 1) {
    return true;
  } else {
    return false;
  }
}

//Reset Question Number Method
void reset() {
  _questionNumber = 0;
}

}