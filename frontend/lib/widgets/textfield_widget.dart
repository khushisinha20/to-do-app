import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/colors/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final double borderRadius;
  final int? maxLines;

  const TextFieldWidget({
    Key? key,
    required this.textController,
    required this.hintText,
    required this.borderRadius,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      controller: textController,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textHolder,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
      ),
    );
  }
}
