import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:raghavgarg_navigus/design/colors.dart';
import 'package:get/get.dart';
import 'package:raghavgarg_navigus/global.dart';
import 'package:raghavgarg_navigus/login/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raghavgarg_navigus/student/student_dashboard.dart';
import 'package:raghavgarg_navigus/teacher.dart/teacher_dashboard.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool loading = false;

  login() async {
    setState(() {
      loading = true;
    });

    await FirebaseFirestore.instance
        .collection("users")
        .doc(email.text)
        .get()
        .then((value) {
      setState(() {
        loading = false;
      });
      Map<String, dynamic>? m = value.data();
      if (value.data() != null) {
        if (m!["password"] == password.text) {
          userData = m;
          if (userData["role"] == 0) {
            Get.to(() => StudentDashboard());
          } else {
            Get.to(() => TeacherDashboard());
          }
        } else {
          Get.snackbar("Password is Incorrect", "",
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        Get.snackbar("User is not exists", "",
            snackPosition: SnackPosition.BOTTOM);
      }
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (email.text.length == 0 || password.text.length == 0) {
              Get.snackbar("All Fields Are Compulsory", "",
                  snackPosition: SnackPosition.BOTTOM);
            } else {
              login();
            }
          },
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ),
        body: loading == true
            ? Center(child: CircularProgressIndicator())
            : InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Text(
                        "Welcome",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 50),
                      ),
                      Text("Login To Navigus APP"),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white),
                        height: 60,
                        width: double.infinity,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: primary,
                                  ),
                                  hintText: "E-Mail",
                                  border: InputBorder.none),
                            )),
                      ),
                      SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white),
                        height: 60,
                        width: double.infinity,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: password,
                              obscureText: true,
                              // keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.password,
                                    color: primary,
                                  ),
                                  hintText: "Password",
                                  border: InputBorder.none),
                            )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Spacer(),
                                  Text("Not Have an Account?",
                                      style: TextStyle(fontSize: 18)),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => Signup());
                                    },
                                    child: Text(" " + "Sign UP",
                                        style: TextStyle(
                                            color: primary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ],
                          ),
                          // }),
                        ],
                      ),
                    ]),
                  ),
                ),
              ));
  }
}
