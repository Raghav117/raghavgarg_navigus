import 'package:flutter/material.dart';
import 'package:raghavgarg_navigus/design/colors.dart';
import 'package:raghavgarg_navigus/teacher.dart/addMCQ.dart';
import 'package:get/get.dart';

class MCQ extends StatefulWidget {
  const MCQ({Key? key}) : super(key: key);

  @override
  _MCQState createState() => _MCQState();
}

class _MCQState extends State<MCQ> {
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
  List show = [];
  @override
  void initState() {
    super.initState();
    questions.forEach((element) {
      show.add(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "ADD MCQ",
        onPressed: () {
          Get.to(() => AddMCQ());
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "STACK",
              style: TextStyle(
                  color: primary, fontSize: 25, fontWeight: FontWeight.bold),
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
            ...List.generate(questions.length, (index) {
              List list = questions[index]["options"].split(",").toList();
              // List answers = questions[index]["answers"].split(",").toList();
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          show[index] = !show[index];
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Row(
                            children: [
                              Spacer(),
                              Text(
                                questions[index]["questions"],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.delete),
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    show[index] == false
                        ? Container()
                        : Wrap(
                            children: list.map((e) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: questions[index]["answers"]
                                                    .contains(e) ==
                                                true
                                            ? primary
                                            : Colors.transparent,
                                        border: Border.all(color: primary)),
                                    child: Center(
                                      child: Text(
                                        e.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: questions[index]["answers"]
                                                      .contains(e) ==
                                                  true
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
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
