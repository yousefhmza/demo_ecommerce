import '../../../../../core/services/responsive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/theme/theme.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/view/views.dart';
import '../../../controller/layout_controller.dart';
import '../../../models/bnb_item_model.dart';

class BNBItem3 extends StatefulWidget {
  final BNBItemModel bnbItemModel;
  final bool isSelected;

  const BNBItem3(this.bnbItemModel, {required this.isSelected, super.key});

  @override
  State<BNBItem3> createState() => _BNBItem3State();
}

class _BNBItem3State extends State<BNBItem3> with SingleTickerProviderStateMixin {
  final LayoutController layoutController = Get.find<LayoutController>();
  late final AnimationController animationController;
  late final Animation<double> sizeAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Time.t450ms);
    sizeAnimation = Tween<double>(begin: 0, end: (Get.width - AppSize.s100) / 5).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
    if (widget.isSelected) animationController.forward();
  }

  @override
  void didUpdateWidget(covariant BNBItem3 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.isSelected && widget.isSelected) animationController.forward();
    if (oldWidget.isSelected && !widget.isSelected) animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: sizeAnimation,
          builder: (context, child) =>
              Container(width: sizeAnimation.value, height: AppSize.s2, color: AppColors.black),
        ),
        const VerticalSpace(AppSize.s8),
        CustomImage(
          image: widget.isSelected ? widget.bnbItemModel.activeIcon : widget.bnbItemModel.icon,
          height: 24.adaptSize,
          width: 24.adaptSize,
          color: widget.isSelected ? AppColors.black : AppColors.gray500,
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.v),
          child: CustomText(
            widget.bnbItemModel.title ?? "",
            style: CustomTextStyles.labelLargeCairoGray500.copyWith(
              color: widget.isSelected ? AppColors.black : AppColors.gray500,
            ),
          ),
        ),
      ],
    );
  }
}
