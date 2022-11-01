import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_test/controller/db_controller.dart';
import 'package:mock_test/model/hive_model.dart';
import 'package:mock_test/view/constants/spaces/dimensions.dart';
import 'package:mock_test/view/constants/styles/colors.dart';
import 'package:mock_test/view/screens/screen%201/widget/test_card.dart';
import 'package:mock_test/view/screens/screen%202/screen_2.dart';

class ScreenOne extends StatelessWidget {
  ScreenOne({super.key, this.index});
  int? index;
  @override
  Widget build(BuildContext context) {
    DbController dbController = Get.put(DbController());
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
              padding:const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Obx(
                    () {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: dbController.testNames.length,
                        itemBuilder: (context, index) {
                          TestNameModel? tests = dbController.testNames[index];
                          return TestCardWidget(
                            size: size,
                            title: tests.testName,
                            on: tests.createdOn,
                          );
                        },
                      );
                    },
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
