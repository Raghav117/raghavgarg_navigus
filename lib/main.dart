import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:raghavgarg_navigus/dashboard/teacher_dashboard.dart';
import 'package:raghavgarg_navigus/login/signup.dart';
import 'design/colors.dart';
import 'login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Navigus",
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      theme: ThemeData(
          textTheme: GoogleFonts.mulishTextTheme(),
          textSelectionTheme: TextSelectionThemeData(
              cursorColor: primary,
              selectionColor: primary,
              selectionHandleColor: primary),
          iconTheme: IconThemeData(color: primary),
          primaryColor: primary,
          accentColor: primary),
      home: TeacherDashboard(),
    );
  }
}
