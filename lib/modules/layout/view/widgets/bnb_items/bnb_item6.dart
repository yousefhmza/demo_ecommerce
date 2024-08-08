import '../../../../../core/services/responsive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/view/views.dart';
import '../../../controller/layout_controller.dart';
import '../../../models/bnb_item_model.dart';

class BNBItem6 extends StatefulWidget {
  final BNBItemModel bnbItemModel;
  final bool isSelected;

  const BNBItem6(this.bnbItemModel, {required this.isSelected, super.key});

  @override
  State<BNBItem6> createState() => _BNBItem6State();
}

class _BNBItem6State extends State<BNBItem6> with SingleTickerProviderStateMixin {
  final LayoutController layoutController = Get.find<LayoutController>();
  late final AnimationController animationController;
  late final Animation<double> sizeAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Time.t150ms);
    sizeAnimation = Tween<double>(begin: AppSize.s0, end: AppSize.s4).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
    if (widget.isSelected) animationController.forward();
  }

  @override
  void didUpdateWidget(covariant BNBItem6 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.isSelected && widget.isSelected) animationController.forward();
    if (oldWidget.isSelected && !widget.isSelected) animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
            padding: const EdgeInsets.only(top: AppPadding.p6),
            child: CircleAvatar(radius: sizeAnimation.value, backgroundColor: AppColors.black),
          ),
        ),
      ],
    );
  }
}
