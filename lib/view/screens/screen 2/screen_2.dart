import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_test/controller/checkbox_controller.dart';
import 'package:mock_test/view/constants/styles/colors.dart';
import 'package:mock_test/view/screens/screen%202/widget/checkbox_widget.dart';
import 'package:mock_test/view/screens/screen%202/widget/text_field.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    CheckBoxController checkBoxController = Get.put(CheckBoxController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kWhite,
        toolbarHeight: 80,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: kBlue,
            size: 30,
          ),
        ),
        title: const Text(
          "Create New Test",
          style: TextStyle(
              color: kBlack, fontWeight: FontWeight.w500, fontSize: 25),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //<<<<<Test_Name>>>>>//
                const TextFieldWidget(),

                //<<<<<Topics>>>>>//
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Topics",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: kBlue,
                      letterSpacing: 1,
                    ),
                  ),
                ),

                //<<<<<Check_Box>>>>>//
                GetBuilder<CheckBoxController>(builder: (controller) {
                  if (checkBoxController.list.isEmpty) {
                    return const Center(
                      child: CupertinoActivityIndicator(
                        color: kBlue,
                      ),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: checkBoxController.list.length,
                    itemBuilder: (context, index) {
                      final data = checkBoxController.list[index];
                      return GetBuilder<CheckBoxController>(
                        builder: (_) {
                          return CheckBoxWidget(
                            categoryName: data.categoryName,
                            subCategories: data.subCategories,
                            categoryIndex: index,
                            isVisible: data.isVisible,
                            categoryCheck: data.isChecked,
                          );
                        },
                      );
                    },
                  );
                }),

                //<<<<<Button>>>>>//
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(size.width, 45),
                        backgroundColor: kBlue,
                        elevation: 0,
                      ),
                      child: const Text(
                        "Create",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
