import 'package:flutter/material.dart';
import 'package:raghavgarg_navigus/design/colors.dart';
import 'package:raghavgarg_navigus/global/globalParameters.dart';
import 'package:get/get.dart';

class StudentReport extends StatefulWidget {
  const StudentReport({Key? key}) : super(key: key);

  @override
  _StudentReportState createState() => _StudentReportState();
}

class _StudentReportState extends State<StudentReport> {
  int totalScore = 0;
  int attemp = 0;
  double score = 0;
  int totalQuestions = 0;
  dialog(String name) {
    // Navigator.pop(context);
    // totalScore += int.parse(questions[page]["level"]);
    Get.defaultDialog(
        title: "Score of the $name Subject",
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
                  totalQuestions.toString(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
                child: Center(
              child: Text("Your's Score in each Subject",
                  style: TextStyle(fontSize: 25, color: primary)),
            )),
            SizedBox(
              height: 60,
            ),
            ...List.generate(courses.length, (index) {
              List list = courses[index][courses[index].keys.toList()[0]];
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          courses[index].keys.toList()[0],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: list.map((e) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              dialog(e.toString());
                              // Get.to(() => MCQ());
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: primary)),
                              child: Center(
                                child: Text(
                                  e.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: primary),
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
