import '../../../../core/services/responsive_service.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/theme.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';

class LangItem extends StatelessWidget {
  final bool isSelected;
  final String language;

  const LangItem({this.isSelected = false, required this.language, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 16.v),
            child: Row(
              children: [
                if (isSelected)
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primary, width: AppSize.s2),
                    ),
                    padding: const EdgeInsets.all(AppPadding.p2),
                    child: Container(
                      decoration: ShapeDecoration(shape: CircleBorder(), color: AppColors.primary),
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: 3.v),
                  child: CustomText(
                    language,
                    style: CustomTextStyles.bodyLargeCairo,
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: AppColors.gray300, height: AppSize.s1),
        ],
      ),
    );
  }
}
