import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_and_split/controller/app_controller.dart';
import 'package:tip_and_split/controller/value_controller.dart';
import 'package:tip_and_split/view/widgets/bill_input.dart';
import 'package:tip_and_split/view/widgets/bottom_card.dart';
import 'package:tip_and_split/view/widgets/custom_tip_card.dart';
import 'package:tip_and_split/view/widgets/modalsheet_container.dart';
import 'package:tip_and_split/view/widgets/size_config.dart';
import 'package:tip_and_split/view/widgets/split_icon.dart';
import 'package:tip_and_split/view/widgets/tip_card.dart';

class HomePage extends StatelessWidget {
  AppController controller = Get.put(AppController());
  final mycontroller = TextEditingController();
  HomePage({key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tip&Split"),
          backgroundColor: Colors.teal,
        ),
        body: ListView(
          children: [
            GetBuilder<AppController>(
              builder: (controller) => Padding(
                padding: EdgeInsets.only(
                    top: SizeConfig.heightMultiplier,
                    left: SizeConfig.widthMultiplier * 10,
                    right: SizeConfig.widthMultiplier * 10),
                child: Column(
                  children: [
                    BillInputWidget(),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Choose tip:",
                          style: TextStyle(
                              fontSize: SizeConfig.heightMultiplier * 2.5,
                              color: Color(0xff073627)),
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (controller.cardSelected1 == false) {
                                  controller.cardSelected1 = true;
                                  controller.cardSelected2 = false;
                                  controller.cardSelected3 = false;
                                  controller.cardSelected4 = false;
                                  controller.cardSelected5 = false;
                                }
                                controller.update();
                                Get.find<ValueController>().updateTip(0);
                              },
                              child: TipCardWidget(
                                text: " 0% ",
                                isSelected: controller.cardSelected1,
                              ),
                            ),
                            GestureDetector(
                                child: TipCardWidget(
                                    text: "10%",
                                    isSelected: controller.cardSelected2),
                                onTap: () {
                                  if (controller.cardSelected2 == false) {
                                    controller.cardSelected2 =
                                        !controller.cardSelected2;
                                    controller.cardSelected1 = false;
                                    controller.cardSelected3 = false;
                                    controller.cardSelected4 = false;
                                    controller.cardSelected5 = false;
                                    controller.update();
                                    Get.find<ValueController>().updateTip(10);
                                  }
                                }),
                            GestureDetector(
                              child: TipCardWidget(
                                text: "15%",
                                isSelected:
                                    controller.cardSelected3 ? true : false,
                              ),
                              onTap: () {
                                if (controller.cardSelected3 == false) {
                                  controller.cardSelected3 =
                                      !controller.cardSelected3;
                                  controller.cardSelected2 = false;
                                  controller.cardSelected1 = false;
                                  controller.cardSelected4 = false;
                                  controller.cardSelected5 = false;
                                  controller.update();
                                  Get.find<ValueController>().updateTip(15);
                                }
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 2,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              child: TipCardWidget(
                                text: "20%",
                                isSelected:
                                    controller.cardSelected4 ? true : false,
                              ),
                              onTap: () {
                                if (controller.cardSelected4 == false) {
                                  controller.cardSelected4 =
                                      !controller.cardSelected4;
                                  controller.cardSelected2 = false;
                                  controller.cardSelected3 = false;
                                  controller.cardSelected1 = false;
                                  controller.cardSelected5 = false;
                                  controller.update();
                                  Get.find<ValueController>().updateTip(20);
                                }
                              },
                            ),
                            SizedBox(
                              width: SizeConfig.widthMultiplier * 5,
                            ),
                            Expanded(
                              child: GestureDetector(
                                child: CustomTipCardWidget(
                                  isSelected:
                                      controller.cardSelected5 ? true : false,
                                ),
                                onTap: () {
                                  if (controller.cardSelected5 == false) {
                                    controller.cardSelected5 =
                                        !controller.cardSelected5;
                                    controller.cardSelected2 = false;
                                    controller.cardSelected3 = false;
                                    controller.cardSelected1 = false;
                                    controller.cardSelected4 = false;
                                    controller.update();
                                  }
                                  showModalBottomSheet(
                                    
                                      context: context,
                                      builder: (context) => Container(
                                            color: Color(0xff87FFD1),
                                            child: ModalSheetContainer(
                                                mycontroller: mycontroller),
                                          ));
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 2,
                        ),
                        SplitIconWidget(),
                        Center(
                          child: MaterialButton(
                              color: Color(0xff1BB479),
                              elevation: 0,
                              height: SizeConfig.heightMultiplier * 6,
                              minWidth: SizeConfig.widthMultiplier * 63,
                              onPressed: () {
                                Get.find<ValueController>().updatePerBill();
                              },
                              child: Text(
                                "Calculate",
                                style: TextStyle(
                                    fontSize: SizeConfig.textMultiplier * 3),
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            BottomCardWidget(),
          ],
        ),
      ),
    );
  }
}
