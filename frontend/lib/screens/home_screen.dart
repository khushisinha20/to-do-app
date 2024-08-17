import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/colors/app_colors.dart';
import 'package:frontend/screens/add_task.dart';
import 'package:frontend/screens/all_tasks.dart';
import 'package:frontend/widgets/button_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/background_image.png"),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: "Hello",
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: "\nStart your beautiful day!",
                    style: TextStyle(
                      color: AppColors.smallTextColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
            ),
            InkWell(
              onTap: () {
                Get.to(() => AddTask(),
                    transition: Transition.zoom,
                    duration: Duration(milliseconds: 500));
              },
              child: ButtonWidget(
                backgroundColor: AppColors.mainColor,
                text: "Add Task",
                textColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.to(() => AllTasks(),
                    transition: Transition.fade,
                    duration: Duration(seconds: 1));
              },
              child: ButtonWidget(
                backgroundColor: Colors.white,
                text: "View all",
                textColor: AppColors.smallTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
