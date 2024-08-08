import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import 'package:flutter/material.dart';

class DrawerOptionItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color? color;
  final VoidCallback onTap;

  const DrawerOptionItem({
    required this.text,
    required this.icon,
    required this.onTap,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Row(
          children: [
            CustomIcon(icon, color: color ?? AppColors.black),
            const HorizontalSpace(AppSize.s12),
            Expanded(
              child: CustomText(
                text,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
