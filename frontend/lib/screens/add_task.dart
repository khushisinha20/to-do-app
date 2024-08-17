import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/colors/app_colors.dart';
import 'package:frontend/widgets/button_widget.dart';
import 'package:frontend/widgets/textfield_widget.dart';
import 'package:get/get.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = new TextEditingController();
    TextEditingController detailController = new TextEditingController();
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/background_image.png"))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back),
                  color: AppColors.secondaryColor,
                )
              ],
            ),
            Column(
              children: [
                TextFieldWidget(
                    textController: nameController,
                    hintText: "Task name",
                    borderRadius: 30),
                SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  textController: detailController,
                  hintText: "Task detail",
                  borderRadius: 15,
                  maxLines: 3,
                ),
                SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                    backgroundColor: AppColors.mainColor,
                    text: "Add",
                    textColor: Colors.white)
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            )
          ],
        ),
      ),
    );
  }
}
