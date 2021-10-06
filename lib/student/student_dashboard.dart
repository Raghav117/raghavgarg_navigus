import 'package:flutter/material.dart';
import 'package:raghavgarg_navigus/design/colors.dart';
import 'package:raghavgarg_navigus/global/globalParameters.dart';
import 'package:get/get.dart';
import 'package:raghavgarg_navigus/student/student_mcq.dart';
import 'package:raghavgarg_navigus/student/student_quiz.dart';
import 'package:raghavgarg_navigus/student/student_report.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({Key? key}) : super(key: key);

  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Text(
              "Student Dashboard",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SafeArea(
              child: Row(
            children: [
              Spacer(),
              Text(
                "Hello, ",
                style: TextStyle(fontSize: 25),
              ),
              Text(
                "Raghav Garg",
                style: TextStyle(
                    color: primary, fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Spacer(),
            ],
          )),
          Spacer(),
          InkWell(
            onTap: () {
              Get.to(() => StudentReport());
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 80,
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text(
                  "Check Your Report",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: () {
              Get.to(() => StudentQuiz());
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 80,
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text(
                  "Attemp Quiz",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
