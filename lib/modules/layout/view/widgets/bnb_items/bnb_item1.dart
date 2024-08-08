import '../../../../../core/services/responsive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/theme/theme.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/view/views.dart';
import '../../../models/bnb_item_model.dart';

class BNBItem1 extends BottomNavigationBarItem {
  final BNBItemModel bnbItemModel;

  BNBItem1(this.bnbItemModel, {super.key})
      : super(
          icon: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomImage(
                image: bnbItemModel.icon,
                height: 24.adaptSize,
                width: 24.adaptSize,
                color: AppColors.gray500,
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.v),
                child: CustomText(
                  bnbItemModel.title ?? "",
                  style: CustomTextStyles.labelLargeCairoGray500.copyWith(color: AppColors.gray500),
                ),
              ),
            ],
          ),
          activeIcon: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomImage(image: bnbItemModel.activeIcon, height: 24.adaptSize, width: 24.adaptSize),
              Padding(
                padding: EdgeInsets.only(top: 8.v),
                child: CustomText(bnbItemModel.title ?? "", style: Get.theme.textTheme.labelLarge),
              ),
            ],
          ),
          label: '',
        );
}
