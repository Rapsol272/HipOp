import 'package:datathon/size.dart';
import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:datathon/result_page.dart';
import 'package:datathon/home_page.dart';

late List<List<dynamic>> questionList = [];
late List<dynamic> questionCurrent = [];

class Question_page extends StatefulWidget {
  final String id;
  final List<List<dynamic>> list;
  Question_page({Key? key, required this.id, required this.list})
      : super(key: key);

  @override
  State<Question_page> createState() => _Question_pageState();
}

class _Question_pageState extends State<Question_page> {
// Variables
  String question = "";
  String answer1 = "";
  String answer2 = "";
  String link1 = "";
  String link2 = "";

  @override
  Widget build(BuildContext context) {
    getQuestion(widget.list, widget.id);

    question = questionCurrent[1];
    answer1 = questionCurrent[2];
    answer2 = questionCurrent[3];
    link1 = questionCurrent[4];
    link2 = questionCurrent[5];
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        //MediaQuery methods in use
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/fond.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                right: 21,
                left: 21,
                top: 77,
                bottom: 77,
              ),
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              height: SizeConfig.safeBlockVertical * 45,
              width: MediaQuery.of(context).size.width > 500
                  ? SizeConfig.safeBlockVertical * 130
                  : SizeConfig.safeBlockVertical * 100,
              child: Text(
                question,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              alignment: Alignment.center,
            ),
            MediaQuery.of(context).size.width > 600
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => link1[0] == "Q"
                                    ? Question_page(
                                        id: link1, list: widget.list)
                                    : ResultPage(id: link1)),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 50),
                          height: SizeConfig.safeBlockVertical * 11.6,
                          width: SizeConfig.safeBlockVertical * 40,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Text(
                            answer1,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => link2[0] == "Q"
                                    ? Question_page(
                                        id: link2, list: widget.list)
                                    : ResultPage(id: link2)),
                          );
                        },
                        child: Container(
                          height: SizeConfig.safeBlockVertical * 11.6,
                          width: SizeConfig.safeBlockVertical * 40,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Text(
                            answer2,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => link1[0] == "Q"
                                    ? Question_page(
                                        id: link1, list: widget.list)
                                    : ResultPage(id: link1)),
                          );
                        },
                        child: Container(
                          height: 80,
                          width: 300,
                          margin: const EdgeInsets.only(bottom: 32),
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Text(
                            answer1,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => link2[0] == "Q"
                                    ? Question_page(
                                        id: link2, list: widget.list)
                                    : ResultPage(id: link2)),
                          );
                        },
                        child: Container(
                          height: 80,
                          width: 300,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Text(
                            answer2,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/xml/question.xml');
}

Future<List<List<dynamic>>> xmlDataInList() async {
  var xmlString = await loadAsset();
  List<List<dynamic>> questionList = [];
  final document = xml.XmlDocument.parse(xmlString);
  //xml to list
  document
      .findAllElements('question')
      .map((each) => eachtolist(each, questionList))
      .toList();
  return await questionList;
}

void eachtolist(xml.XmlElement each, List<List<dynamic>> questionList) {
  List<String> question = [];
  question.add(each.findElements('ID').first.text);
  question.add(each.findElements('intitule').first.text);
  question.add(each.findElements('sortie1').first.text);
  question.add(each.findElements('sortie2').first.text);
  question.add(each.findElements('resultat1').first.text);
  question.add(each.findElements('resultat2').first.text);
  questionList.add(question);
}

void getQuestion(List<List<dynamic>> questionList, String index) {
  questionCurrent = [];
  questionList.forEach((element) {
    if (element[0] == index) {
      questionCurrent = element;
    }
  });
}
