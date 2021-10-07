import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:raghavgarg_navigus/login/signup.dart';
import 'package:raghavgarg_navigus/student/student_dashboard.dart';
import 'package:raghavgarg_navigus/student/student_mcq.dart';
import 'package:raghavgarg_navigus/student/student_quiz.dart';
import 'package:raghavgarg_navigus/teacher.dart/addMCQ.dart';
import 'package:raghavgarg_navigus/teacher.dart/mcq.dart';
import 'design/colors.dart';
import 'login/login.dart';
import 'student/student_report.dart';
import 'teacher.dart/teacher_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    await FirebaseFirestore.instance
        .collection("teachers")
        .doc("asfda")
        .set({"Data": "asdfas"}).whenComplete(() async {
      print("yeah");
      await FirebaseFirestore.instance
          .collection("teachers")
          .get()
          .then((value) => print(value.docs));
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Navigus",
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      theme: ThemeData(
          // textTheme: GoogleFonts.mulishTextTheme(),
          textSelectionTheme: TextSelectionThemeData(
              cursorColor: primary,
              selectionColor: primary,
              selectionHandleColor: primary),
          iconTheme: IconThemeData(color: primary),
          primaryColor: primary,
          accentColor: primary),
      home: Login(),
    );
  }
}
