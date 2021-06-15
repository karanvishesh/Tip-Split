import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_and_split/controller/app_controller.dart';
import 'package:tip_and_split/controller/value_controller.dart';
import 'package:tip_and_split/model/value_model.dart';
import 'package:tip_and_split/view/widgets/size_config.dart';

class SplitIconWidget extends StatelessWidget {
  AppController controller = Get.put(AppController());
  SplitIconWidget({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Split:",
            style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 2.5,
                color: Color(0xff073627)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    Get.find<ValueController>().decrementPerson();
                  }),
              SizedBox(
                width: SizeConfig.widthMultiplier * 1.2,
              ),
              GetX<ValueController>(
                init: ValueController(),
                builder: (_) => Text(
                  '${_.valueModel.value.noOfSplits}',
                  style: TextStyle(
                      fontSize: SizeConfig.textMultiplier * 4,
                      color: Color(0xff007B47),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: SizeConfig.widthMultiplier * 1.2,
              ),
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Get.find<ValueController>().incrementPerson();
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
