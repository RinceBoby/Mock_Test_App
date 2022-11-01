import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:mock_test/model/hive_model.dart';

class DbController extends GetxController {
  Box<TestNameModel> testBox = Hive.box<TestNameModel>(boxName);

  RxList<TestNameModel> testNames = <TestNameModel>[].obs;

  //<<<<<Get_Test_Names>>>>>//
  getTestNames() {
    testNames.value = testBox.values.toList();
  }

  //<<<<<Add_Test_Names>>>>>//
  addTestNames(TestNameModel allTestNames) {
    testBox.add(allTestNames);
    getTestNames();
  }

  //<<<<<Delete_Test>>>>>//
  deleteTest(int index) {
    testBox.deleteAt(index);
    getTestNames();
  }

  @override
  void onInit() {
    getTestNames();
    super.onInit();
  }
}
