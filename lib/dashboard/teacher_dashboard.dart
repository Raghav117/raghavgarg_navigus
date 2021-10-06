import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raghavgarg_navigus/design/colors.dart';

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
            ))
          ],
        ),
      ),
    );
  }
}
