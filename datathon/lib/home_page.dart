import 'package:datathon/question_page.dart';
import 'package:flutter/material.dart';
import 'package:datathon/question_page.dart';
import 'package:xml/xml.dart' as xml;
import 'package:datathon/size.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/fond.jpg"), fit: BoxFit.cover),
          ),
          child: FutureBuilder<List<List<dynamic>>>(
              future:
                  xmlDataInList(), // a previously-obtained Future<String> or null
              builder: (BuildContext context,
                  AsyncSnapshot<List<List<dynamic>>> snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                  List<List> list = snapshot.data ?? <List<List>>[];
                  children = <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width > 500
                              ? SizeConfig.safeBlockHorizontal * 70
                              : SizeConfig.safeBlockHorizontal * 85,
                          height: SizeConfig.safeBlockVertical * 60,
                          margin: const EdgeInsets.only(top: 30),
                          child: Image.asset("assets/images/logoFoncer.png",
                              fit: BoxFit.cover),
                        ),
                        MediaQuery.of(context).size.width > 950
                            ? Container(
                                padding: const EdgeInsets.only(
                                  bottom: 13,
                                  right: 15,
                                  left: 15,
                                  top: 13,
                                ),
                                margin: const EdgeInsets.only(
                                    right: 380, left: 380, top: 30),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Question_page(
                                                id: "Q1",
                                                list: list,
                                              )),
                                    );
                                  },
                                  child: Text(
                                    "Commencer",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                padding: const EdgeInsets.only(
                                  bottom: 13,
                                  right: 10,
                                  left: 10,
                                  top: 13,
                                ),
                                margin: const EdgeInsets.only(
                                    right: 100, left: 100, top: 30),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Question_page(
                                                id: "Q1",
                                                list: list,
                                              )),
                                    );
                                  },
                                  child: Text(
                                    "Commencer",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ];
                } else if (snapshot.hasError) {
                  children = <Widget>[
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    )
                  ];
                } else {
                  children = <Widget>[
                    SizedBox(
                      child: CircularProgressIndicator(),
                      width: 60,
                      height: 60,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    )
                  ];
                }
                return Column(
                  children: children,
                );
              })),
    );
  }
}
