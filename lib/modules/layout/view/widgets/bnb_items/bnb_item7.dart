import '../../../../../core/services/responsive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/view/views.dart';
import '../../../controller/layout_controller.dart';
import '../../../models/bnb_item_model.dart';

class BNBItem7 extends StatefulWidget {
  final BNBItemModel bnbItemModel;
  final bool isSelected;

  const BNBItem7(this.bnbItemModel, {required this.isSelected, super.key});

  @override
  State<BNBItem7> createState() => _BNBItem7State();
}

class _BNBItem7State extends State<BNBItem7> with SingleTickerProviderStateMixin {
  final LayoutController layoutController = Get.find<LayoutController>();
  late final AnimationController animationController;
  late final Animation<double> sizeAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Time.t450ms);
    sizeAnimation = Tween<double>(begin: AppSize.s40, end: (Get.width - AppSize.s32) / 5).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
    if (widget.isSelected) animationController.forward();
  }

  @override
  void didUpdateWidget(covariant BNBItem7 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.isSelected && widget.isSelected) animationController.forward();
    if (oldWidget.isSelected && !widget.isSelected) animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: sizeAnimation,
      builder: (context, child) => Container(
        width: sizeAnimation.value,
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s8),
          color: widget.isSelected ? AppColors.gray200 : AppColors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImage(
              image: widget.isSelected ? widget.bnbItemModel.activeIcon : widget.bnbItemModel.icon,
              height: 24.adaptSize,
              width: 24.adaptSize,
              color: widget.isSelected ? AppColors.black : AppColors.gray500,
            ),
            if (widget.isSelected)
              Padding(
                padding: const EdgeInsetsDirectional.only(top: AppSize.s4),
                child: CustomText(
                  widget.bnbItemModel.title ?? "",
                  autoSized: true,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: widget.isSelected ? AppColors.black : AppColors.gray500,
                        fontSize: FontSize.s12,
                        fontWeight: FontWeightManager.medium,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
