
import 'package:flutter/material.dart';
import 'package:quiz_application/question_vault.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(quizApp());

class quizApp extends StatelessWidget {
  const quizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //AppBar
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Quiz Application"),
        ),
        backgroundColor: Colors.teal[100],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: questionPage(),
          ),
        ),
      ),
    );
  }
}

class questionPage extends StatefulWidget {
  const questionPage({super.key});

  @override
  State<questionPage> createState() => _questionPageState();
}

class _questionPageState extends State<questionPage> {

  //TODO Method for Icon List
  List <Widget> iconList=[

  ];

  //Variable For QuestionVault
  QuestionVault questionVault=QuestionVault();


  //Method For Correct Answer
  void checkMyAnswer(bool clickedAnswer){
    bool actualAnswer=questionVault.setAnswer();

    setState(() {
      if (questionVault.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You are reached the end of the quiz.',
        ).show();

        //reset all question
        questionVault.reset();

        //reset all icons
        iconList = [];
      } else {
        if (clickedAnswer == actualAnswer) {
          iconList.add(
            Icon(
              Icons.check,
              color: Colors.green[800],
            ),
          );
        } else {
          iconList.add(
            Icon(
              Icons.close,
              color: Colors.red[800],
            ),
          );
        }
      }

      questionVault.nextQuestion();
    });


  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [

        //For Question Loading
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(

              child: Text(
                questionVault.setQuestionTittle(),

                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ),
          ),),

        //For Image Loading
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
                child: Card(
                  color: Colors.white,
                  shadowColor: Colors.grey,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(

                          questionVault.setImage(),

                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
            ),
          ),
        ),

        // Answer Button For True
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),

                ),
                onPressed: (){
                  //On Pressed Logic
                  checkMyAnswer(true);

                },

                child: Text("True",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),),

        //Button For False
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: (){
                  //On Pressed Logic

                  checkMyAnswer(false);

                },

                child: Text("False",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),),

        Expanded(child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: iconList,
          ),
        )),

      ],
    );
  }
}



