import 'package:get/get.dart';
import 'package:mock_test/model/category_subcategory_model.dart';

class CheckBoxController extends GetxController {
  List<Category> list = [];

  /*THis function will change the checkbox.
    The category(topic name) will be checked if the whole subcategory is checked.
    Else, only the selected suubcategory(concepts) will be checked, not the category.*/
  void changeCheckboxValue({
    required bool value,
    required int categoryIndex,
    required int subIndex,
  }) {
    checkboxList[categoryIndex].subCategories[subIndex].isChecked = value;

    int subLength = checkboxList[categoryIndex].subCategories.length;

    int checkedSubLength = checkboxList[categoryIndex]
        .subCategories
        .where((element) => element.isChecked)
        .toList()
        .length;
    if (subLength == checkedSubLength) {
      checkboxList[categoryIndex].isChecked = true;
    } else {
      checkboxList[categoryIndex].isChecked = false;
    }
    update();
  }

  // void changeCategoryCheckboxValue(bool value, int categoryIndex, int length) {
  //   for (var i = 0; i < length; i++) {
  //     checkboxList[categoryIndex].subCategories[i].isChecked = value;
  //   }
  //   checkboxList[categoryIndex].isChecked = value;
  //   update();
  // }

  //<<<<<Dropdown_Function>>>>>//
  void changeVisiblity(bool value, int index) {
    checkboxList[index].isVisible = value;
    update();
  }
}
