import '../../../../../core/services/responsive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/view/views.dart';
import '../../../controller/layout_controller.dart';
import '../../../models/bnb_item_model.dart';

class BNBItem4 extends StatefulWidget {
  final BNBItemModel bnbItemModel;
  final bool isSelected;

  const BNBItem4(this.bnbItemModel, {required this.isSelected, super.key});

  @override
  State<BNBItem4> createState() => _BNBItem4State();
}

class _BNBItem4State extends State<BNBItem4> with SingleTickerProviderStateMixin {
  final LayoutController layoutController = Get.find<LayoutController>();
  late final AnimationController animationController;
  late final Animation<double> sizeAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Time.t450ms);
    sizeAnimation = Tween<double>(begin: AppSize.s0, end: AppSize.s12).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
    if (widget.isSelected) animationController.forward();
  }

  @override
  void didUpdateWidget(covariant BNBItem4 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.isSelected && widget.isSelected) animationController.forward();
    if (oldWidget.isSelected && !widget.isSelected) animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8, vertical: AppPadding.p6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s8),
        color: widget.isSelected ? AppColors.black : AppColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImage(
            image: widget.isSelected ? widget.bnbItemModel.activeIcon : widget.bnbItemModel.icon,
            height: 24.adaptSize,
            width: 24.adaptSize,
            color: widget.isSelected ? AppColors.white : AppColors.gray500,
          ),
          AnimatedBuilder(
            animation: sizeAnimation,
            builder: (context, child) => Padding(
              padding: const EdgeInsetsDirectional.only(start: AppSize.s8),
              child: CustomText(
                widget.bnbItemModel.title ?? "",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: widget.isSelected ? AppColors.white : AppColors.gray500,
                      fontSize: sizeAnimation.value,
                      fontWeight: FontWeightManager.medium,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
