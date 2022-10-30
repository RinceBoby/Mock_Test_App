import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_test/controller/checkbox_controller.dart';
import 'package:mock_test/model/category_subcategory_model.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({
    required this.categoryCheck,
    required this.categoryName,
    required this.subCategories,
    required this.categoryIndex,
    required this.isVisible,
    super.key,
  });

  final bool categoryCheck;
  final String categoryName;
  final List<SubCategory> subCategories;
  final int categoryIndex;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CheckBoxController>();

    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: Checkbox(
            value: categoryCheck,
            onChanged: (value) {
              if (!isVisible) {
                controller.changeVisiblity(
                  !isVisible,
                  categoryIndex,
                );
              }

              controller.changeCategoryCheckboxValue(
                value!,
                categoryIndex,
                subCategories.length,
              );
            },
          ),
          title: Text(
            categoryName,
          ),
          onTap: () {
            controller.changeVisiblity(
              !isVisible,
              categoryIndex,
            );
          },
        ),
        const SizedBox(
          height: 10.0,
        ),
        ...List.generate(
          isVisible ? subCategories.length : 0,
          (index) => buildSubcategoryWidget(
            subCategories[index].name,
            index,
            controller,
          ),
        )
      ],
    );
  }

  //
  //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Method>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
  //
  Padding buildSubcategoryWidget(
      String name, int index, CheckBoxController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Row(
        children: [
          Checkbox(
            splashRadius: 0.0,
            value: subCategories[index].isChecked,
            onChanged: (value) {
              controller.changeCheckboxValue(
                value: value!,
                categoryIndex: categoryIndex,
                subIndex: index,
              );
            },
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(name)
        ],
      ),
    );
  }
}
