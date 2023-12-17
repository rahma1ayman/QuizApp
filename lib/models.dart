class Question {
  String questionText;
  List<Answer> answerList;
  Question(this.questionText, this.answerList);
}

class Answer {
  String answerText;
  bool isCorrect;
  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestion() {
  List<Question> list = [];

  list.add(
    Question(
      "Who is owner of flutter ?",
      [
        Answer('Google', true),
        Answer('oppo', false),
        Answer('nokia', false),
        Answer('apple', false),
      ],
    ),
  );
  list.add(
    Question(
      "Who is owner of Iphone ?",
      [
        Answer('Google', false),
        Answer('oppo', false),
        Answer('nokia', false),
        Answer('apple', true),
      ],
    ),
  );
  list.add(
    Question(
      "Who is the best core team in GDSC ?",
      [
        Answer('web', false),
        Answer('cyber security', false),
        Answer('flutter', true),
        Answer('Ui/Ux', false),
      ],
    ),
  );
  list.add(
    Question(
      "What is the bast movie ?",
      [
        Answer('Harry potter and chamber of secret', false),
        Answer('Harry Potter and the Deathly Hallows', true),
        Answer('Harry potter and the half blood princes', true),
        Answer('Harry potter and the golbet of fire', false),
      ],
    ),
  );

  return list;
}
