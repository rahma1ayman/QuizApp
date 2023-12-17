import 'package:flutter/material.dart';

import 'models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Question> questionList = getQuestion();
  int currentQues = 0;
  Answer? answerSelected;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Simple Quiz App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            Text(
              'Question ${currentQues + 1} / ${questionList.length}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    questionList[currentQues].questionText,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const Positioned(
                  right: -20,
                  top: 25,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                  ),
                ),
                const Positioned(
                  left: -20,
                  top: 25,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 90,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_sharp,
                      size: 40,
                      color: Colors.green,
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                for (Answer answer in questionList[currentQues].answerList)
                  answerButton(answer),
              ],
            ),
            nextButton(),
          ],
        ),
      ),
    );
  }

  answerButton(Answer answer) {
    bool isSelected = answer == answerSelected;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        height: 70,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: isSelected ? Colors.orange : Colors.grey),
          onPressed: () {
            setState(() {
              answerSelected = answer;
            });
          },
          child: Text(answer.answerText),
        ),
      ),
    );
  }

  nextButton() {
    bool isLast = false;
    if (currentQues == questionList.length - 1) {
      isLast = true;
    }
    return SizedBox(
      width: 380,
      height: 65,
      child: ElevatedButton(
        onPressed: () {
          if (answerSelected!.isCorrect) {
            score++;
          }
          if (answerSelected == null) {
          } else {
            if (isLast) {
// dialoge
              bool isPassed = true;
              if (score < questionList.length - 1 * 0.8) {
                isPassed = false;
              }
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(
                    "${isPassed ? 'Passed' : 'Failed'} | Score is : $score",
                    style: TextStyle(
                      color: isPassed ? Colors.green : Colors.red,
                    ),
                  ),
                  content: SizedBox(
                    width: 100,
                    height: 60,
                    child: Center(
                      child: SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                              score = 0;
                              currentQues = 0;
                              answerSelected = null;
                            });
                          },
                          child: const Text('Reset'),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              setState(() {
                answerSelected = null;
                currentQues++;
              });
            }
          }
        },
        child: Text(isLast ? 'Submit' : 'Next'),
      ),
    );
  }
}
