import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_and_split/controller/app_controller.dart';
import 'package:tip_and_split/controller/value_controller.dart';
import 'package:tip_and_split/view/widgets/size_config.dart';

class BottomCardWidget extends StatelessWidget {
  AppController controller = Get.put(AppController());
  BottomCardWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 10),
      decoration: BoxDecoration(
          color: Color(0xff87FFD1), borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.heightMultiplier * 6,
            left: 20.0,
            right: 20.0,
            bottom: SizeConfig.heightMultiplier * 7.5),
        child: Column(
          children: [
            Text(
              "Total per person:",
              style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2.6,
                  color: Colors.black87),
            ),
            GetX<ValueController>(
              init: ValueController(),
              builder: (_) => Text(
                '₹ ${_.valueModel.value.billPerPerson.toPrecision(2)}',
                style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 7.8,
                    color: Color(0xff007B47)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "Bill:",
                      style: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 3,
                          color: Color(0xff073627)),
                    ),
                    GetX<ValueController>(
                      init: ValueController(),
                      builder: (_) => Text(
                        '₹ ${(_.valueModel.value.totalBill / _.valueModel.value.noOfSplits).toDouble().toPrecision(2)}',
                        style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 4,
                            color: Color(0xff073627)),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Tip:",
                      style: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 3,
                          color: Color(0xff073627)),
                    ),
                    GetX<ValueController>(
                      init: ValueController(),
                      builder: (_) => Text(
                        '₹ ${(((_.valueModel.value.tip / 100) * _.valueModel.value.totalBill) / _.valueModel.value.noOfSplits).toDouble().toPrecision(2)}',
                        style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 4,
                            color: Color(0xff073627)),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
