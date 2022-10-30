import 'package:hive_flutter/adapters.dart';
part 'hive_model.g.dart';

@HiveType(typeId: 0)
class TestNameModel {
  @HiveField(0)
  final String testName;

  @HiveField(1)
  final String createdOn;

  TestNameModel({
    required this.testName,
    required this.createdOn,
  });
}

const String boxName = "testNameBox";
