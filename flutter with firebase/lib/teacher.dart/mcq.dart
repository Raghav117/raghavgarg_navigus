import 'package:flutter/material.dart';
import 'package:raghavgarg_navigus/design/colors.dart';
import 'package:raghavgarg_navigus/global.dart';
import 'package:raghavgarg_navigus/teacher.dart/addMCQ.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MCQ extends StatefulWidget {
  const MCQ({Key? key, required this.subject}) : super(key: key);
  final String subject;

  @override
  _MCQState createState() => _MCQState();
}

class _MCQState extends State<MCQ> {
  List questions = [];
  List show = [];
  List<String> elementid = [];

  bool loading = false;

  getMcq() async {
    setState(() {
      loading = true;
    });

    FirebaseFirestore.instance
        .collection(widget.subject.toLowerCase())
        .where('email', isEqualTo: userData["email"])
        .snapshots()
        .listen((value) {
      setState(() {
        loading = false;
      });
      questions.clear();
      elementid.clear();
      show.clear();
      value.docs.forEach((element) {
        elementid.add(element.id.toString());
        questions.add(element.data());
        show.add(false);
        setState(() {});
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getMcq();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "ADD MCQ",
        onPressed: () {
          Get.to(() => AddMCQ(
                subject: widget.subject,
              ));
        },
      ),
      body: loading == true
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      widget.subject,
                      style: TextStyle(
                          color: primary,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      "Your ${questions.length} Questions",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
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
                                      questions[index]["question"].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                    Spacer(),
                                    IconButton(
                                      onPressed: () async {
                                        setState(() {
                                          loading = true;
                                        });
                                        await FirebaseFirestore.instance
                                            .collection(
                                                widget.subject.toLowerCase())
                                            .doc(elementid[index])
                                            .delete()
                                            .then((_) {
                                          setState(() {
                                            loading = false;
                                          });
                                        }).catchError((onError) {
                                          setState(() {
                                            loading = false;
                                          });
                                          Get.snackbar(onError.toString(), "",
                                              snackPosition:
                                                  SnackPosition.BOTTOM);
                                        });
                                      },
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: questions[index]["answers"]
                                                          .toString()
                                                          .contains(e) ==
                                                      true
                                                  ? primary
                                                  : Colors.transparent,
                                              border:
                                                  Border.all(color: primary)),
                                          child: Center(
                                            child: Text(
                                              e.toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: questions[index]
                                                                ["answers"]
                                                            .toString()
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
