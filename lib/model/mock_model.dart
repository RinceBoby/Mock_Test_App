// To parse this JSON data, do
//
//     final mockTestModel = mockTestModelFromJson(jsonString);

import 'dart:convert';

List<MockTestModel> mockTestModelFromJson(String str) =>
    List<MockTestModel>.from(
        json.decode(str).map((x) => MockTestModel.fromJson(x)));

String mockTestModelToJson(List<MockTestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MockTestModel {
  MockTestModel({
    this.topicName,
    this.concepts,
  });

  String? topicName;
  List<String>? concepts;

  factory MockTestModel.fromJson(Map<String, dynamic> json) => MockTestModel(
        topicName: json["topicName"],
        concepts: List<String>.from(json["concepts"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "topicName": topicName,
        "concepts": List<dynamic>.from(concepts!.map((x) => x)),
      };
}
