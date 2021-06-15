import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_and_split/controller/app_controller.dart';
import 'package:tip_and_split/controller/value_controller.dart';
import 'package:tip_and_split/model/value_model.dart';
import 'package:tip_and_split/view/widgets/size_config.dart';

class BillInputWidget extends StatefulWidget {
  BillInputWidget({
    Key key,
  }) : super(key: key);

  @override
  _BillInputWidgetState createState() => _BillInputWidgetState();
}

class _BillInputWidgetState extends State<BillInputWidget> {
  AppController controller = Get.put(AppController());

  final mycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Enter bill amount:",
          style: TextStyle(
              fontSize: SizeConfig.textMultiplier * 2.7,
              color: Color(0xff073627)),
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 1.2,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.widthMultiplier * 22,
              right: SizeConfig.widthMultiplier * 22),
          child: Row(
            children: [
              Text(
                "₹",
                style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 4.2,
                    color: Colors.teal),
              ),
              SizedBox(
                width: SizeConfig.widthMultiplier,
              ),
              Expanded(
                child: TextField(
                  controller: mycontroller,
                  onChanged: (value) {
                    Get.find<ValueController>()
                        .updateBill(int.parse(mycontroller.text));
                  },
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: SizeConfig.textMultiplier * 4,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
