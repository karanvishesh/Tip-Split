import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_and_split/controller/value_controller.dart';
import 'package:tip_and_split/view/widgets/size_config.dart';

class CustomTipCardWidget extends StatelessWidget {
  CustomTipCardWidget({
    this.color = Colors.white,
    this.isSelected,
  });
  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.heightMultiplier * 2.5,
          horizontal: SizeConfig.widthMultiplier * 4.7),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal, width: 1.5),
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              spreadRadius: 0,
              blurRadius: 2,
              offset: Offset(3, 3)),
        ],
        color: isSelected ? Color(0xff1BB479) : color,
        borderRadius: BorderRadius.circular(35),
      ),
      child: GetX<ValueController>(
        init: ValueController(),
        builder: (_) => Text(
          '${_.valueModel.value.customTip}',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 3,
          ),
        ),
      ),
    );
  }
}
