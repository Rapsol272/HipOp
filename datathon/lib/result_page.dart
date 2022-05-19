import 'package:flutter/material.dart';
import 'package:datathon/size.dart';
import 'package:datathon/home_page.dart';

const List<String> resultat = [
  "moins de 6 mois",
  "entre 6 et 12 mois",
  "un an",
  "plus de 2 ans",
  "jamais"
];

class ResultPage extends StatefulWidget {
  final String id;

  const ResultPage({Key? key, required this.id}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
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
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                right: 10,
                left: 10,
                top: 77,
                bottom: 20,
              ),
              padding: (MediaQuery.of(context).size.width > 500 &&
                      MediaQuery.of(context).size.height < 600)
                  ? const EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 50,
                      bottom: 20,
                    )
                  : const EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 160,
                      bottom: 20,
                    ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              height: MediaQuery.of(context).size.width > 500
                  ? SizeConfig.safeBlockVertical * 60
                  : SizeConfig.safeBlockVertical * 50,
              width: MediaQuery.of(context).size.width > 500
                  ? SizeConfig.safeBlockHorizontal * 80
                  : SizeConfig.safeBlockHorizontal * 100,
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Votre opération est estimée dans un délai de :\n ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize:
                            MediaQuery.of(context).size.width > 500 ? 30 : 25,
                        fontWeight: FontWeight.w600,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: resultat[int.parse(widget.id)],
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: MediaQuery.of(context).size.width > 500
                                ? 55
                                : 45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              alignment: Alignment.center,
            ),
            MediaQuery.of(context).size.width > 800
                ? Container(
                    padding: const EdgeInsets.only(
                      bottom: 15,
                      right: 18,
                    ),
                    margin: const EdgeInsets.only(right: 300, left: 300),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      icon: const Icon(
                        Icons.refresh,
                        color: Colors.black,
                        size: 42.0,
                      ),
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.only(
                        bottom: 13, right: 20, left: 10, top: 5),
                    margin: const EdgeInsets.only(right: 150, left: 150),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      icon: const Icon(
                        Icons.refresh,
                        color: Colors.black,
                        size: 42.0,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
