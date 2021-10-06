import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:raghavgarg_navigus/design/colors.dart';

class StudentMCQ extends StatefulWidget {
  const StudentMCQ({Key? key}) : super(key: key);

  @override
  _StudentMCQState createState() => _StudentMCQState();
}

class _StudentMCQState extends State<StudentMCQ> {
  List<bool> ans = [false, false, false, false];
  List<String> answers = [];
  int totalScore = 0;
  List questions = [
    {
      "questionid": "5465",
      "questions": "What is the Principle of Stack",
      "options": "FILO,FIFO,LIFO,LILO",
      "answers": "FILO,LIFO",
      "level": "1"
    },
    {
      "questionid": "5465",
      "questions": "What is the Principle of Stack",
      "options": "FILO,FIFO,LIFO,LILO",
      "answers": "FILO,LIFO",
      "level": "1"
    },
    {
      "questionid": "5465",
      "questions": "What is the Principle of Stack",
      "options": "FILO,FIFO,LIFO,LILO",
      "answers": "FILO,LIFO",
      "level": "1"
    },
    {
      "questionid": "5465",
      "questions": "What is the Principle of Stack",
      "options": "FILO,FIFO,LIFO,LILO",
      "answers": "FILO,LIFO",
      "level": "1"
    },
    {
      "questionid": "5465",
      "questions": "What is the Principle of Stack",
      "options": "FILO,FIFO,LIFO,LILO",
      "answers": "FILO,LIFO",
      "level": "1"
    },
    {
      "questionid": "5465",
      "questions": "What is the Principle of Stack",
      "options": "FILO,FIFO,LIFO,LILO",
      "answers": "FILO,LIFO",
      "level": "1"
    },
    {
      "questionid": "5465",
      "questions": "What is the Principle of Stack",
      "options": "FILO,FIFO,LIFO,LILO",
      "answers": "FILO,LIFO",
      "level": "1"
    },
    {
      "questionid": "5465",
      "questions": "What is the Principle of Stack",
      "options": "FILO,FIFO,LIFO,LILO",
      "answers": "FILO,LIFO",
      "level": "1"
    },
    {
      "questionid": "5465",
      "questions": "What is the Principle of Stack",
      "options": "FILO,FIFO,LIFO,LILO",
      "answers": "FILO,LIFO",
      "level": "1"
    },
    {
      "questionid": "5465",
      "questions": "What is the Principle of Stack",
      "options": "FILO,FIFO,LIFO,LILO",
      "answers": "FILO,LIFO",
      "level": "1"
    },
    {
      "questionid": "5465",
      "questions": "What is the Principle of Stack",
      "options": "FILO,FIFO,LIFO,LILO",
      "answers": "FILO,LIFO",
      "level": "1"
    },
    {
      "questionid": "5465",
      "questions": "What is the Principle of Stack",
      "options": "FILO,FIFO,LIFO,LILO",
      "answers": "FILO,LIFO",
      "level": "1"
    },
    {
      "questionid": "5465",
      "questions": "What is the Principle of Stack",
      "options": "FILO,FIFO,LIFO,LILO",
      "answers": "FILO,LIFO",
      "level": "1"
    },
    {
      "questionid": "5465",
      "questions": "What is the Principle of Stack",
      "options": "FILO,FIFO,LIFO,LILO",
      "answers": "FILO,LIFO",
      "level": "1"
    },
    {
      "questionid": "5465",
      "questions": "What is the Principle of Stack",
      "options": "FILO,FIFO,LIFO,LILO",
      "answers": "FILO,LIFO",
      "level": "1"
    },
    {
      "questionid": "5465",
      "questions": "What is the Principle of Stack",
      "options": "FILO,FIFO,LIFO,LILO",
      "answers": "FILO,LIFO",
      "level": "1"
    },
    {
      "questionid": "5465",
      "questions": "What is the Principle of Stack",
      "options": "FILO,FIFO,LIFO,LILO",
      "answers": "FILO,LIFO",
      "level": "1"
    },
    {
      "questionid": "5465",
      "questions": "What is the Principle of Stack",
      "options": "FILO,FIFO,LIFO,LILO",
      "answers": "FILO,LIFO",
      "level": "1"
    },
    {
      "questionid": "5465",
      "questions": "What is the Principle of Stack",
      "options": "FILO,FIFO,LIFO,LILO",
      "answers": "FILO,LIFO",
      "level": "1"
    },
    {
      "questionid": "5465",
      "questions": "What is the Principle of Stack",
      "options": "FILO,FIFO,LIFO,LILO",
      "answers": "FILO,LIFO",
      "level": "1"
    },
    {
      "questionid": "5465",
      "questions": "What is the Principle of Stack",
      "options": "FILO,FIFO,LIFO,LILO",
      "answers": "FILO,LIFO",
      "level": "1"
    },
    {
      "questionid": "5465",
      "questions": "What is the Principle of Stack",
      "options": "FILO,FIFO,LIFO,LILO",
      "answers": "FILO,LIFO",
      "level": "1"
    },
    {
      "questionid": "5465",
      "questions": "What is the Principle of Stack",
      "options": "FILO,FIFO,LIFO,LILO",
      "answers": "FILO,LIFO",
      "level": "1"
    },
    {
      "questionid": "5465",
      "questions": "What is the Principle of Stack",
      "options": "FILO,FIFO,LIFO,LILO",
      "answers": "FILO,LIFO",
      "level": "1"
    },
  ];
  double score = 0;
  int time = 30;
  int attemp = 0;
  Timer? f;
  @override
  void initState() {
    super.initState();
    f = Timer.periodic(Duration(seconds: 1), (value) {
      --time;
      if (time == 0) {
        if (page == 9) {
          calculateScore();
          dialog();
          f!.cancel();
        } else {
          calculateScore();
          pageController.animateToPage(page + 1,
              duration: Duration(seconds: 1), curve: Curves.linear);
          time = 30;
        }
      }
      setState(() {});
    });
  }

  @required
  void dispose() {
    f!.cancel();
  }

  calculateScore() {
    List c = questions[page]["answers"].split(',').toList();
    List options = questions[page]["options"].split(',').toList();
    double optionalScore = 0;
    ans.forEach((element) {
      if (element == true) {
        // answers.add(options[ans.indexOf(element)]);
        if (c.contains(options[ans.indexOf(element)]) == true) {
          optionalScore += int.parse(questions[page]["level"]) / c.length;
        } else {
          optionalScore -= int.parse(questions[page]["level"]) / c.length;
        }
      }
    });
    if (optionalScore < 0) {
      optionalScore = 0;
    }
    score += optionalScore;
    ++attemp;
    print("Attemp : " + attemp.toString());
    print("Score : " + score.toString());
    ans = [false, false, false, false];
  }

  int page = 0;

  dialog() {
    Navigator.pop(context);
    totalScore += int.parse(questions[page]["level"]);
    Get.defaultDialog(
        title: "Score of the Quiz",
        content: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  "Total Questions : ",
                  style: TextStyle(color: primary, fontWeight: FontWeight.bold),
                )),
                Expanded(
                    child: Text(
                  "10",
                  style: TextStyle(color: primary, fontWeight: FontWeight.bold),
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  "Attemp Questions : ",
                  style: TextStyle(color: primary, fontWeight: FontWeight.bold),
                )),
                Expanded(
                    child: Text(
                  attemp.toString(),
                  style: TextStyle(color: primary, fontWeight: FontWeight.bold),
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  "Total Score : ",
                  style: TextStyle(color: primary, fontWeight: FontWeight.bold),
                )),
                Expanded(
                    child: Text(
                  (totalScore * 10).toString(),
                  style: TextStyle(color: primary, fontWeight: FontWeight.bold),
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  "Total Marks Obtained : ",
                  style: TextStyle(color: primary, fontWeight: FontWeight.bold),
                )),
                Expanded(
                    child: Text(
                  (score * 10).toString(),
                  style: TextStyle(color: primary, fontWeight: FontWeight.bold),
                )),
              ],
            ),
          ],
        ));
  }

  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    print(time);
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Text(
              "STACK",
              style: TextStyle(
                  color: primary, fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Your Questions",
            style: TextStyle(
                color: Colors.orange,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                shape: BoxShape.circle, border: Border.all(color: primary)),
            child: Center(
              child: Text(
                time.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20, color: primary),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                if (page != 9) {
                  pageController.animateToPage(page + 1,
                      duration: Duration(seconds: 1), curve: Curves.linear);
                  time = 30;
                  ans = [false, false, false, false];

                  setState(() {});
                } else {
                  f!.cancel();
                  dialog();
                }
              },
              child: Container(
                  width: 180,
                  height: 40,
                  decoration: BoxDecoration(
                      color: primary, borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    "Tab for skip...",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  )))),
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: PageView.builder(
                controller: pageController,
                // allowImplicitScrolling: false,
                physics: new NeverScrollableScrollPhysics(),
                itemCount: 10,
                onPageChanged: (index) {
                  time = 30;
                  print("yah");
                  totalScore += int.parse(questions[page - 1]["level"]);
                  setState(() {});
                },
                itemBuilder: (context, index) {
                  page = index;

                  List list = questions[index]["options"].split(",").toList();
                  return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Row(
                                children: [
                                  Text(
                                    "Q: ${index + 1}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                  Spacer(),
                                  Text(
                                    questions[index]["questions"],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Wrap(
                          children: list.map((e) {
                            int i = list.indexOf(e);
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  ans[i] = !ans[i];
                                  setState(() {});
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: ans[i] == true
                                          ? primary
                                          : Colors.transparent,
                                      border: Border.all(color: primary)),
                                  child: Center(
                                    child: Text(
                                      e.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: ans[i] == true
                                            ? Colors.white
                                            : primary,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        )
                      ],
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 40,
          ),
          InkWell(
              onTap: () {
                if (page != 9) {
                  calculateScore();
                  pageController.animateToPage(page + 1,
                      duration: Duration(seconds: 1), curve: Curves.linear);
                  time = 30;
                  setState(() {});
                } else {
                  f!.cancel();
                  calculateScore();
                  dialog();
                }
              },
              child: Container(
                  width: 180,
                  height: 40,
                  decoration: BoxDecoration(
                      color: primary, borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    "Continue...",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  )))),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
