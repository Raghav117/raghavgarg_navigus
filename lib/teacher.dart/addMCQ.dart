import 'package:flutter/material.dart';
import 'package:raghavgarg_navigus/design/colors.dart';
import 'package:get/get.dart';

class AddMCQ extends StatefulWidget {
  const AddMCQ({Key? key}) : super(key: key);

  @override
  _AddMCQState createState() => _AddMCQState();
}

class _AddMCQState extends State<AddMCQ> {
  TextEditingController question = TextEditingController();
  TextEditingController option1 = TextEditingController();
  TextEditingController option2 = TextEditingController();
  TextEditingController option3 = TextEditingController();
  TextEditingController option4 = TextEditingController();
  TextEditingController answer1 = TextEditingController();
  TextEditingController answer2 = TextEditingController();
  TextEditingController answer3 = TextEditingController();
  TextEditingController answer4 = TextEditingController();
  List<TextEditingController> optionList = [];
  List optionListString = ["option1", "option2", "option3", "option4"];
  List correct = [false, false, false, false];
  int level = 0;
  @override
  void initState() {
    super.initState();
    optionList = [option1, option2, option3, option4];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   tooltip: "ADD MCQ",
      //   onPressed: () {},
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Add Question",
              style: TextStyle(
                  color: primary, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: TextField(
                          controller: question,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Type Question"),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text("For Correct Answer you have to press this  --->"),
                      Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Wrap(
                    children: optionList.map((e) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    correct[optionList.indexOf(e)] =
                                        !correct[optionList.indexOf(e)];
                                  });
                                },
                                child: Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      color:
                                          correct[optionList.indexOf(e)] == true
                                              ? primary
                                              : Colors.grey,
                                      shape: BoxShape.circle),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:
                                        correct[optionList.indexOf(e)] == true
                                            ? primary
                                            : Colors.transparent,
                                    border: Border.all(color: primary)),
                                child: Center(
                                  child: TextField(
                                    controller: e,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Type " +
                                            optionListString[
                                                optionList.indexOf(e)]),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color:
                                          correct[optionList.indexOf(e)] == true
                                              ? Colors.white
                                              : primary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "LEVEL",
                style: TextStyle(
                    color: primary, fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Wrap(
              children: [
                ...List.generate(
                    3,
                    (index) => Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: InkWell(
                            onTap: () {
                              level = index;
                              setState(() {});
                            },
                            child: Container(
                              width: 40,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: level == index
                                      ? primary
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: primary)),
                              child: Center(
                                  child: Text(index.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                            ),
                          ),
                        )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                bool check = true;
                optionList.forEach((element) {
                  if (element.text.length == 0 && check == true) {
                    Get.snackbar("All Fields Are Compulsory", "",
                        snackPosition: SnackPosition.BOTTOM);
                    check = false;
                  }
                });
                if (check && question.text.length == 0) {
                  check = false;
                  Get.snackbar("All Fields Are Compulsory", "",
                      snackPosition: SnackPosition.BOTTOM);
                } else {}
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: primary)),
                child: Center(
                    child: Text("Submit",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20))),
              ),
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
