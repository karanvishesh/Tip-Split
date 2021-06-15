import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tip_and_split/controller/app_controller.dart';

import 'package:tip_and_split/model/value_model.dart';

class ValueController extends GetxController {
  final valueModel = ValueModel().obs;

  updateBill(int newvalue) {
    valueModel.update((model) {
      model.totalBill = newvalue;
    });
  }

  updateTip(int newvalue) {
    valueModel.update((model) {
      model.tip = newvalue;
    });
  }

  updateCustomTip(String newvalue) {
    valueModel.update((model) {
      model.customTip = newvalue;
    });
  }

  incrementPerson() {
    valueModel.update((model) {
      model.noOfSplits++;
    });
  }

  decrementPerson() {
    valueModel.update((model) {
      if (model.noOfSplits > 1) {
        model.noOfSplits--;
      }
    });
  }

  updatePerBill() {
    valueModel.update((model) {
      model.billPerPerson =
          (model.totalBill + ((model.tip / 100) * model.totalBill)) /
              model.noOfSplits;
    });
  }
}
