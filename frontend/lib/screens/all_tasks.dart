import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/colors/app_colors.dart';
import 'package:frontend/widgets/button_widget.dart';
import 'package:frontend/widgets/task_widget.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> myData = [
      "Try Harder",
      "Try Smarter",
    ];

    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color(0xff2e3253).withOpacity(0.5),
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
    );

    final rightEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.redAccent,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
      alignment: Alignment.centerRight,
    );

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
                    Icon(
                      Icons.arrow_back,
                      color: AppColors.secondaryColor,
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
                child: ListView.builder(
                    itemCount: myData.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        background: leftEditIcon,
                        secondaryBackground: rightEditIcon,
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
                                          )),
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
                                                textColor: Colors.white),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            ButtonWidget(
                                                backgroundColor:
                                                    AppColors.mainColor,
                                                text: "Edit",
                                                textColor: Colors.white)
                                          ],
                                        ),
                                      ));
                                });
                          } else {
                            Future.delayed(Duration(seconds: 1),
                                () => direction == DismissDirection.endToStart);
                          }
                        },
                        key: ObjectKey(index),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: TaskWidget(
                              text: myData[index],
                              color: Color.fromRGBO(100, 130, 173, 1)),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
