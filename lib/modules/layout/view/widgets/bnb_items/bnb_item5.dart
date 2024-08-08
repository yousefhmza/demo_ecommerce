import '../../../../../core/services/responsive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/view/views.dart';
import '../../../controller/layout_controller.dart';
import '../../../models/bnb_item_model.dart';

class BNBItem5 extends StatefulWidget {
  final BNBItemModel bnbItemModel;
  final bool isSelected;

  const BNBItem5(this.bnbItemModel, {required this.isSelected, super.key});

  @override
  State<BNBItem5> createState() => _BNBItem5State();
}

class _BNBItem5State extends State<BNBItem5> with SingleTickerProviderStateMixin {
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
  void didUpdateWidget(covariant BNBItem5 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.isSelected && widget.isSelected) animationController.forward();
    if (oldWidget.isSelected && !widget.isSelected) animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(
              image: widget.isSelected ? widget.bnbItemModel.activeIcon : widget.bnbItemModel.icon,
              height: 24.adaptSize,
              width: 24.adaptSize,
              color: widget.isSelected ? AppColors.black : AppColors.gray500,
            ),
            AnimatedBuilder(
              animation: sizeAnimation,
              builder: (context, child) => Padding(
                padding: const EdgeInsetsDirectional.only(start: AppSize.s8),
                child: CustomText(
                  widget.bnbItemModel.title ?? "",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: widget.isSelected ? AppColors.black : AppColors.gray500,
                        fontSize: sizeAnimation.value,
                        fontWeight: FontWeightManager.medium,
                      ),
                ),
              ),
            ),
          ],
        ),
        if (widget.isSelected)
          const Padding(
            padding: EdgeInsets.only(top: AppPadding.p6),
            child: CircleAvatar(radius: AppSize.s4, backgroundColor: AppColors.black),
          )
      ],
    );
  }
}
