import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_test/controller/checkbox_controller.dart';
import 'package:mock_test/model/topic_concept_model.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({
    required this.topicCheck,
    required this.topicName,
    required this.concepts,
    required this.topicIndex,
    required this.isVisible,
    super.key,
  });

  final bool topicCheck;
  final String topicName;
  final List<Concepts> concepts;
  final int topicIndex;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CheckBoxController>();

    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: Checkbox(
            value: topicCheck,
            onChanged: (value) {
              if (!isVisible) {
                controller.changeVisiblity(
                  !isVisible,
                  topicIndex,
                );
              }
              // controller.changeCategoryCheckboxValue(
              //   value!,
              //   categoryIndex,
              //   subCategories.length,
              // );
            },
          ),
          title: Text(
            topicName,
          ),
          onTap: () {
            controller.changeVisiblity(
              !isVisible,
              topicIndex,
            );
          },
          trailing: !isVisible
              ? const Icon(Icons.keyboard_arrow_down_rounded)
              : const Icon(Icons.keyboard_arrow_up_rounded),
        ),
        const SizedBox(
          height: 10.0,
        ),
        ...List.generate(
          isVisible ? concepts.length : 0,
          (index) => buildConceptsWidget(
            concepts[index].name,
            index,
            controller,
          ),
        ),
      ],
    );
  }

  //
  //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Method>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
  //
  Padding buildConceptsWidget(
    String name,
    int index,
    CheckBoxController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Row(
        children: [
          Checkbox(
            splashRadius: 0.0,
            value: concepts[index].isChecked,
            onChanged: (value) {
              controller.changeCheckboxValue(
                value: value!,
                categoryIndex: topicIndex,
                subIndex: index,
              );
            },
          ),
          const SizedBox(
            width: 10.0,
          ),
          Flexible(
            child: Text(
              name,
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }
}
