import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raghavgarg_navigus/design/colors.dart';
import 'package:raghavgarg_navigus/global/globalParameters.dart';
import 'package:raghavgarg_navigus/teacher.dart/mcq.dart';

class TeacherDashboard extends StatefulWidget {
  const TeacherDashboard({Key? key}) : super(key: key);

  @override
  _TeacherDashboardState createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Teacher Dashboard",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold),
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
                      color: primary,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
              ],
            )),
            SizedBox(
              height: 30,
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
                              Get.to(() => MCQ());
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
