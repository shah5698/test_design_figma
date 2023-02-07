import 'package:flutter/material.dart';
import 'package:test_design_figma/custom_dropdown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Figma App",
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffecf4d2),
            ),
            child: const SafeArea(
              child: SingleChildScrollView(child: MainScreen()),
            ),
          ),
        ));
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 0, 24),
          height: 48,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 99, 0),
                width: 139,
                height: double.infinity,
                child: const Text(
                  "Meine Finanzen",
                  style: TextStyle(
                      color: Color(0xff222222),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      height: 1.5),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Image.asset(
                  'assets/images/battery.png',
                  width: 48,
                  height: 48,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Image.asset(
                  'assets/images/cross.png',
                  width: 4,
                  height: 48,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 150,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(25, 13, 24, 13),
                  width: 146,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xffffffff),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x4c94b03a),
                        offset: Offset(0, 19),
                        blurRadius: 18,
                      )
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 9, 0),
                        width: 22,
                        height: 22,
                        child: Image.asset(
                          'assets/images/trolly.png',
                          width: 22,
                          height: 22,
                        ),
                      ),
                      const Text(
                        'Ausgaben',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                          color: Color(0xff222222),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(25, 13, 24, 13),
                  width: 146,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 9, 0),
                        width: 22,
                        height: 22,
                        child: Image.asset(
                          'assets/images/hand.png',
                          width: 22,
                          height: 22,
                        ),
                      ),
                      const Text(
                        'Einnahmen',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                          color: Color(0xff222222),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            color: Color(0xffffffff),
            boxShadow: [
              BoxShadow(
                color: Color(0x4c94b03a),
                offset: Offset(0, 19),
                blurRadius: 18,
              )
            ],
          ),
          child: Column(
            children: const [
              CustomDropdown(text: "Kontostand"),
            ],
          ),
        )
      ],
    );
  }
}
