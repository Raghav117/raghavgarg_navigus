import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:raghavgarg_navigus/design/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raghavgarg_navigus/global.dart';
import 'package:raghavgarg_navigus/global/globalParameters.dart';

class StudentMCQ extends StatefulWidget {
  const StudentMCQ({Key? key, required this.subject}) : super(key: key);
  final String subject;

  @override
  _StudentMCQState createState() => _StudentMCQState();
}

class _StudentMCQState extends State<StudentMCQ> {
  List<bool> ans = [false, false, false, false];
  List<String> answers = [];
  int totalScore = 0;
  List questions = [];
  double score = 0;
  int time = 30;
  int attemp = 0;
  Timer? f;
  @override
  void initState() {
    super.initState();
    getMcq();
  }

  callTimer() {
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

  bool loading = false;

  getMcq() async {
    setState(() {
      loading = true;
    });

    FirebaseFirestore.instance
        .collection(widget.subject.toLowerCase())
        .limit(10)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        questions.add(element.data());
      });
      print(questions);

      setState(() {
        loading = false;
      });
    }).whenComplete(() {
      setState(() {
        loading = false;
        callTimer();
      });
    }).catchError((onError) {
      setState(() {
        loading = false;
      });
      Get.snackbar(onError.toString(), "", snackPosition: SnackPosition.BOTTOM);
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
          optionalScore +=
              int.parse(questions[page]["level"].toString()) / c.length;
        } else {
          optionalScore -=
              int.parse(questions[page]["level"].toString()) / c.length;
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
  // int totalMarks;
  calculateTotal() async {
    String name = widget.subject.toLowerCase();
    int totalScore =
        this.totalScore + int.parse(questions[page]["level"].toString());
    attemp = attemp;
    double totalMarks = (totalScore * 10);
    double totalMarksObtained = (score * 10);

    int totalQuestions1 = (scores[name.toLowerCase()] == null
            ? 0
            : scores[name.toLowerCase()]["totalQuestions"]) +
        10;
    int attemp1 = (scores[name.toLowerCase()] == null
            ? 0
            : scores[name.toLowerCase()]["totalAttemptQuestions"]) +
        attemp;
    double totalMarks1 = (scores[name.toLowerCase()] == null
            ? 0
            : scores[name.toLowerCase()]["totalMarks"]) +
        totalMarks;
    double totalMarksObtained1 = (scores[name.toLowerCase()] == null
            ? 0
            : scores[name.toLowerCase()]["totalMarksObtained"]) +
        totalMarksObtained;

    scores[name] = {
      "totalAttemptQuestions": attemp1,
      "totalMarks": totalMarks1,
      "totalMarksObtained": totalMarksObtained1,
      "totalQuestions": totalQuestions1
    };
    print(scores[name]);
    setState(() {
      loading = true;
    });
    await FirebaseFirestore.instance
        .collection("student")
        .doc(userData["email"])
        .get()
        .then((value) async {
      var v = FirebaseFirestore.instance
          .collection("student")
          .doc(userData["email"]);
      if (value.data() == null) {
        v.set(scores);
      } else {
        v.update(scores);
      }
    }).whenComplete(() {
      print("yeah");
      setState(() {
        loading = false;
      });
    }).catchError((onError) {
      setState(() {
        loading = false;
      });
      Get.snackbar(onError.toString(), "", snackPosition: SnackPosition.BOTTOM);
    });
  }

  dialog() async {
    await calculateTotal();
    Navigator.pop(context);

    totalScore += int.parse(questions[page]["level"].toString());
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
                  "Total Marks : ",
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
      body: loading == true
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SafeArea(
                  child: Text(
                    widget.subject,
                    style: TextStyle(
                        color: primary,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Yours 10 Questions",
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
                      shape: BoxShape.circle,
                      border: Border.all(color: primary)),
                  child: Center(
                    child: Text(
                      time.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: primary),
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
                            duration: Duration(milliseconds: 100),
                            curve: Curves.linear);
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
                            color: primary,
                            borderRadius: BorderRadius.circular(15)),
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
                        totalScore +=
                            int.parse(questions[page - 1]["level"].toString());
                        setState(() {});
                      },
                      itemBuilder: (context, index) {
                        page = index;

                        List list =
                            questions[index]["options"].split(",").toList();
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
                                          questions[index]["question"],
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
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                            duration: Duration(seconds: 1),
                            curve: Curves.linear);
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
                            color: primary,
                            borderRadius: BorderRadius.circular(15)),
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
