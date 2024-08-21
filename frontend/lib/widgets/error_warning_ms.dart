import 'package:flutter/material.dart';
import 'package:frontend/colors/app_colors.dart';
import 'package:get/get.dart';

class Message {
  static void taskErrorOrWarning(String taskName, String taskErrorOrWarning) {
    Get.snackbar(taskName, taskErrorOrWarning,
        backgroundColor: AppColors.mainColor,
        titleText: Text(
          taskName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.redAccent,
          ),
        ),
        messageText: Text(
          taskErrorOrWarning,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
        ));
  }
}
