import 'package:get/get.dart';
import 'package:mock_test/model/topic_concept_model.dart';
import 'package:mock_test/service/mock_test/test_service.dart';

class CheckBoxController extends GetxController {
  List<Topic> list = [];

  /*THis function will change the checkbox.
    The category(topic name) will be checked if the whole subcategory is checked.
    Else, only the selected suubcategory(concepts) will be checked, not the category.*/
  void changeCheckboxValue({
    required bool value,
    required int topicIndex,
    required int conceptIndex,
  }) {
    list[topicIndex].concepts[conceptIndex].isChecked = value;

    int subLength = list[topicIndex].concepts.length;

    int checkedSubLength = list[topicIndex]
        .concepts
        .where((element) => element.isChecked)
        .toList()
        .length;
    if (subLength == checkedSubLength) {
      list[topicIndex].isChecked = true;
    } else {
      list[topicIndex].isChecked = false;
    }
    update();
  }

  //<<<<<Dropdown_Function>>>>>//
  void changeVisiblity(bool value, int index) {
    list[index].isVisible = value;
    update();
  }

  //<<<<<<Get_Test_Lists>>>>>>//
  Future<List<Topic>?> getTestDetails() async {
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
