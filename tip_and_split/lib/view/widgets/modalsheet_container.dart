import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_and_split/controller/value_controller.dart';
import 'package:tip_and_split/view/widgets/size_config.dart';

class ModalSheetContainer extends StatefulWidget {
  const ModalSheetContainer({
    Key key,
    @required this.mycontroller,
  }) : super(key: key);

  final TextEditingController mycontroller;

  @override
  _ModalSheetContainerState createState() => _ModalSheetContainerState();
}

class _ModalSheetContainerState extends State<ModalSheetContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: SizeConfig.heightMultiplier * 4),
          child: Text(
            "Enter Tip percent",
            style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 3,
                color: Color(0xff073627)),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 38),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  autofocus: true,
                  controller: widget.mycontroller,
                  onSubmitted: (value) {
                    Navigator.pop(context);
                  },
                  onChanged: (value) {
                    Get.find<ValueController>()
                        .updateTip(int.parse(widget.mycontroller.text));
                    Get.find<ValueController>()
                        .updateCustomTip("${widget.mycontroller.text}%");
                  },
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.textMultiplier * 3.6,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                "%",
                style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 3,
                    color: Color(0xff073627)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
