import 'package:flutter/material.dart';
import 'package:mock_test/view/constants/spaces/dimensions.dart';
import 'package:mock_test/view/constants/styles/colors.dart';

class TestCardWidget extends StatelessWidget {
  const TestCardWidget({
    Key? key,
    required this.size,
    required this.title,
    required this.on,
  }) : super(key: key);

  final Size size;
  final String title;
  final String on;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: 100,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: kRadius15,
          border: Border.all(color: kGrey, width: .3),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                     letterSpacing: 1,
                  ),
                ),
              ),
            ),
            kHeight10,
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15, right: 15),
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: "Created on  ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kGrey,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: on,
                        style: const TextStyle(
                          color: kGrey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
