import '../../../../../core/extensions/non_null_extensions.dart';
import '../../../../../core/services/responsive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../../core/view/views.dart';
import '../../../controller/layout_controller.dart';
import '../../../models/bnb_item_model.dart';

class BNBItem8 extends StatefulWidget {
  final BNBItemModel bnbItemModel;
  final bool isSelected;

  const BNBItem8(this.bnbItemModel, {required this.isSelected, super.key});

  @override
  State<BNBItem8> createState() => _BNBItem8State();
}

class _BNBItem8State extends State<BNBItem8> with SingleTickerProviderStateMixin {
  final LayoutController layoutController = Get.find<LayoutController>();
  late final AnimationController animationController;
  late final Animation<Offset> slideTransition;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Time.t300ms);
    slideTransition = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
    if (widget.isSelected) animationController.forward();
  }

  @override
  void didUpdateWidget(covariant BNBItem8 oldWidget) {
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
        Visibility(
          visible: widget.isSelected,
          maintainAnimation: false,
          maintainInteractivity: false,
          maintainSemantics: false,
          maintainSize: false,
          maintainState: false,
          child: SlideTransition(
            position: slideTransition,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(widget.bnbItemModel.title.orEmpty),
                const VerticalSpace(AppSize.s4),
                CircleAvatar(radius: 4, backgroundColor: widget.isSelected ? AppColors.black : AppColors.transparent),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
