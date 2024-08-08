import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import '../../controller/following_controller.dart';
import '../widgets/following_list_item.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class FollowingScreen extends GetWidget<FollowingController> {
  const FollowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainAppbar(title: AppStrings.lblFollowing.tr, showDefaultBackButton: false),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) => const Divider(height: AppSize.s1, color: AppColors.gray300),
            itemCount: 3,
            itemBuilder: (context, index) => FollowingListItem(),
          ),
        ),
      ],
    );
  }
}
