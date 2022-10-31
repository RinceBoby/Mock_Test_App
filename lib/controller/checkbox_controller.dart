import 'package:get/get.dart';
import 'package:mock_test/model/category_subcategory_model.dart';
import 'package:mock_test/service/mock_test/test_service.dart';

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
    list[categoryIndex].subCategories[subIndex].isChecked = value;

    int subLength = list[categoryIndex].subCategories.length;

    int checkedSubLength = list[categoryIndex]
        .subCategories
        .where((element) => element.isChecked)
        .toList()
        .length;
    if (subLength == checkedSubLength) {
      list[categoryIndex].isChecked = true;
    } else {
      list[categoryIndex].isChecked = false;
    }
    update();
  }

  //<<<<<Dropdown_Function>>>>>//
  void changeVisiblity(bool value, int index) {
    list[index].isVisible = value;
    update();
  }

  //<<<<<<Get_Test_Lists>>>>>>//
  Future<List<Category>?> getTestDetails() async {
    try {
      var data = await TestService.MockTestService();
      update();
      return data;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  void onInit() {
    getTestDetails().then((value) => list = value!);
    super.onInit();
  }
}
