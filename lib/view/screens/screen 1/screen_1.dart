import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:mock_test/model/hive_model.dart';
import 'package:mock_test/view/constants/spaces/dimensions.dart';
import 'package:mock_test/view/constants/styles/colors.dart';
import 'package:mock_test/view/screens/screen%201/widget/test_card.dart';
import 'package:mock_test/view/screens/screen%202/screen_2.dart';

class ScreenOne extends StatelessWidget {
  ScreenOne({super.key});

  Box<TestNameModel> testBox = Hive.box<TestNameModel>(boxName);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: kWhite,
        elevation: 0,
        title: const Text(
          "Mock Test App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: kBlack,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/coding.png"),
                ),
              ),
            ),
            kHeight15,

            //<<<<<Button>>>>>//
            ElevatedButton(
              onPressed: () {
                Get.to(const ScreenTwo());
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: kRadius15),
                fixedSize: Size(size.width * .8, 55),
                elevation: 0,
              ),
              child: const Text(
                "Create New Test",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
            ),
            kHeight20,

            //<<<<<Divider>>>>>//
            const Divider(
              thickness: 3,
              color: kBlue,
            ),
            // kHeight20,

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  // ListView.builder(
                  //   itemCount: ,
                  //   itemBuilder: (context, index) {
                  //   return TestCardWidget(size: size, title: title, on: on);
                  // },),
                  TestCardWidget(
                    size: size,
                    title: "Physics Mock #1",
                    on: "Oct 21 2022 10:19 AM",
                  ),
                  TestCardWidget(
                    size: size,
                    title: "Full Length Test",
                    on: "Oct 19  2022 11:23 AM",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
