import 'package:flutter/material.dart';
import 'package:frontend/colors/app_colors.dart';
import 'package:frontend/controllers/data_controller.dart';
import 'package:frontend/widgets/button_widget.dart';
import 'package:frontend/widgets/task_widget.dart';
import 'package:get/get.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  _loadData() async {
    await Get.find<DataController>().getData();
  }

  @override
  Widget build(BuildContext context) {
    _loadData();
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/background_image.png"),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 60),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: AppColors.secondaryColor,
                        ),
                        SizedBox(width: 20),
                        Container(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.5),
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month_sharp,
                          color: AppColors.secondaryColor,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "2",
                          style: TextStyle(
                              fontSize: 20, color: AppColors.secondaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                child: GetBuilder<DataController>(
                  builder: (controller) {
                    return ListView.builder(
                      itemCount: controller.MyData.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          background: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            color: const Color(0xff2e3253).withOpacity(0.5),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          secondaryBackground: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            color: Colors.redAccent,
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            alignment: Alignment.centerRight,
                          ),
                          onDismissed: (DismissDirection direction) {},
                          confirmDismiss: (DismissDirection direction) async {
                            if (direction == DismissDirection.startToEnd) {
                              showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                barrierColor: Colors.transparent,
                                context: context,
                                builder: (_) {
                                  return Container(
                                    height: 550,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff2e3253)
                                          .withOpacity(0.4),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ButtonWidget(
                                            backgroundColor:
                                                AppColors.mainColor,
                                            text: "View",
                                            textColor: Colors.white,
                                          ),
                                          SizedBox(height: 20),
                                          ButtonWidget(
                                            backgroundColor:
                                                AppColors.mainColor,
                                            text: "Edit",
                                            textColor: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              Future.delayed(
                                  Duration(seconds: 1),
                                  () =>
                                      direction == DismissDirection.endToStart);
                            }
                            return null;
                          },
                          key: ObjectKey(index),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: TaskWidget(
                              text: controller.MyData[index]["task_name"],
                              color: Color.fromRGBO(100, 130, 173, 1),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
