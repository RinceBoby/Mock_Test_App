import 'package:flutter/material.dart';
import 'package:mock_test/view/constants/spaces/dimensions.dart';
import 'package:mock_test/view/constants/styles/colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        style: const TextStyle(
          color: kBlack,
          fontWeight: FontWeight.bold,
        ),
        focusNode: FocusNode(),
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.assignment_ind_outlined,
            color: kBlue,
          ),
          hintText: "Test Name",
          hintStyle: const TextStyle(
            color: kGrey,
            fontWeight: FontWeight.w500,
          ),
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kBlue, width: 1.5),
            borderRadius: kRadius10,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: kRadius10,
            borderSide: const BorderSide(width: 1.5, color: kBlue),
          ),
        ),
      ),
    );
  }
}
