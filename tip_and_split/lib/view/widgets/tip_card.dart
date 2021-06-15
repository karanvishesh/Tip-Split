import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tip_and_split/controller/app_controller.dart';
import 'package:tip_and_split/view/widgets/size_config.dart';

class TipCardWidget extends StatelessWidget {
  TipCardWidget({this.color = Colors.white, this.text, this.isSelected});
  final Color color;
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.heightMultiplier * 2.5,
          horizontal: SizeConfig.widthMultiplier * 5),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff10915F), width: 1.2),
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              spreadRadius: 0,
              blurRadius: 2,
              offset: Offset(3, 3)),
        ],
        color: isSelected ? Color(0xff1BB479) : color,
        borderRadius: BorderRadius.circular(SizeConfig.widthMultiplier * 9),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: SizeConfig.textMultiplier * 3,
        ),
      ),
    );
  }
}
