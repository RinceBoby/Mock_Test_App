
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_test/controller/checkbox_controller.dart';
import 'package:mock_test/model/category_subcategory_model.dart';
import 'package:mock_test/view/constants/styles/colors.dart';
import 'package:mock_test/view/screens/screen%202/widget/checkbox_widget.dart';
import 'package:mock_test/view/screens/screen%202/widget/text_field.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhite,
      floatingActionButton: FloatingActionButton(onPressed: () {
        // ParentChildCheckbox.isParentSelected = true;/

        List<Map<String, dynamic>> list = [
          {
            "topicName": "DC Circuit",
            "concepts": [
              "Combination of resistance",
              "Bulbs",
              "Galvanometer",
              "APS_AJ_1028"
            ]
          },
          {
            "topicName": "Capacitor",
            "concepts": [
              "Isolated sphere as capacitor",
              "Steady state circuits",
              "Spherical capacitor"
            ]
          },
          {
            "topicName": "Dynamics of Particles",
            "concepts": ["Pseudo force", "Spring balance", "Weighing machine"]
          },
          {
            "topicName": "Electrostatics",
            "concepts": [
              "Gauss's law and its applications",
              "Potential difference",
              "Relation between electric field and electric potential"
            ]
          }
        ];

        // String json = jsonEncode(list);

        var categories = categoriesModeFromJson(list);

        for (var element in categories) {
          print(element.categoryName);
        }
      }),
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
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: checkboxList.length,
                  itemBuilder: (context, index) {
                    return GetBuilder<CheckBoxController>(
                      init: CheckBoxController(),
                      builder: (_) {
                        return CheckBoxWidget(
                          categoryName: checkboxList[index].categoryName,
                          subCategories: checkboxList[index].subCategories,
                          categoryIndex: index,
                          isVisible: checkboxList[index].isVisible,
                          categoryCheck: checkboxList[index].isChecked,
                        );
                      },
                    );
                  },
                ),

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
