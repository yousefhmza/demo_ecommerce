import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ChooseOnMapController extends GetxController {
  TextEditingController searchController = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
