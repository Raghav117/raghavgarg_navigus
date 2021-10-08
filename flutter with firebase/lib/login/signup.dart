import 'package:flutter/material.dart';
import 'package:raghavgarg_navigus/design/colors.dart';
import 'package:get/get.dart';
import 'package:raghavgarg_navigus/global.dart';
import 'package:raghavgarg_navigus/student/student_dashboard.dart';
import 'package:raghavgarg_navigus/teacher.dart/teacher_dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();

  int role = 0;
  bool loading = false;

  signup() async {
    setState(() {
      loading = true;
    });

    await FirebaseFirestore.instance
        .collection("users")
        .doc(email.text)
        .get()
        .then((value) async {
      if (value.data() != null) {
        setState(() {
          loading = false;
        });
        Get.snackbar("User is already exists", "",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        userData["name"] = name.text;
        userData["role"] = role;
        userData["password"] = password.text;
        userData["email"] = email.text;
        await FirebaseFirestore.instance
            .collection("users")
            .doc(email.text)
            .set(userData)
            .whenComplete(() {
          setState(() {
            loading = false;
          });
          if (role == 1) {
            Get.to(() => TeacherDashboard());
          } else {
            Get.to(() => StudentDashboard());
          }
        }).catchError((onError) {
          setState(() {
            loading = false;
          });
          Get.snackbar(onError.toString(), "",
              snackPosition: SnackPosition.BOTTOM);
        });
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
            if (email.text.length == 0 ||
                password.text.length == 0 ||
                name.text.length == 0) {
              Get.snackbar("All Fields Are Compulsory", "",
                  snackPosition: SnackPosition.BOTTOM);
            } else {
              signup();
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
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Text(
                        "Create An Account",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
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
                              controller: name,
                              textCapitalization: TextCapitalization.words,
                              // keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.account_box,
                                    color: primary,
                                  ),
                                  hintText: "Full Name",
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
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Spacer(),
                          InkWell(
                            onTap: () {
                              setState(() {
                                role = 0;
                              });
                            },
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(
                                  color: role == 0 ? primary : Colors.grey,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text("Student",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              setState(() {
                                role = 1;
                              });
                            },
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(
                                  color: role == 1 ? primary : Colors.grey,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text("Teacher",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
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
                                  Text("Already Have an Account?",
                                      style: TextStyle(fontSize: 18)),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(" " + "Login",
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
