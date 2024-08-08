import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/globals.dart';
import '../../controller/layout_controller.dart';
import '../components/app_drawer.dart';

class LayoutScreen extends GetWidget<LayoutController> {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: AppDrawer(),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: settings.getBNB,
    );
  }
}
