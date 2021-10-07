import 'package:flutter/material.dart';
import 'package:raghavgarg_navigus/design/colors.dart';
import 'package:raghavgarg_navigus/global.dart';
import 'package:raghavgarg_navigus/global/globalParameters.dart';
import 'package:get/get.dart';
import 'package:raghavgarg_navigus/student/student_mcq.dart';
import 'package:raghavgarg_navigus/student/student_quiz.dart';
import 'package:raghavgarg_navigus/student/student_report.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({Key? key}) : super(key: key);

  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  bool loading = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      loading = true;
    });

    await FirebaseFirestore.instance
        .collection("student")
        .doc(userData["email"])
        .get()
        .then((value) {
      setState(() {
        loading = false;
      });

      if (value.data() != null) {
        scores = value.data()!;
      } else {}
      print(scores);
    }).catchError((onError) {
      setState(() {
        loading = false;
      });
      Get.snackbar(onError.toString(), "", snackPosition: SnackPosition.BOTTOM);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading == true
          ? Center(child: CircularProgressIndicator())
          : Column(
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
                      userData["name"].toString(),
                      style: TextStyle(
                          color: primary,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
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
                        color: primary,
                        borderRadius: BorderRadius.circular(15)),
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
                    Get.to(() => StudentQuiz())!.whenComplete(() {
                      getData();
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 80,
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(15)),
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
