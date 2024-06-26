import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OnBoarding extends StatefulWidget {
  String path;
  String title;
  String subtitle;
  OnBoarding(
      {super.key,
      required this.path,
      required this.title,
      required this.subtitle});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight, image: AssetImage(widget.path))),
      // height: 740,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.125,
            // height: 95,
          ),
          const SizedBox(
            height: 350,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                            // width: 300,
                            // height: 74,
                            // color: Colors.amber,
                            child: Text(
                              widget.title,
                              style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.amber),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: SizedBox(
                            // height: 50,
                            width: 300,
                            child: Text(
                              widget.subtitle,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.amberAccent,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
