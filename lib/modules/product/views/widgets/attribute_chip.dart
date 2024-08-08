import '../../../../core/extensions/color_extension.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import '../../models/responses/inventory_details_model.dart';
import 'package:flutter/material.dart';

class AttributeChip extends StatelessWidget {
  final InventoryDetails inventoryDetails;
  final bool isSelected;
  final VoidCallback onTap;

  const AttributeChip({required this.inventoryDetails, required this.isSelected, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p8),
        decoration: ShapeDecoration(
          shape: StadiumBorder(side: BorderSide(color: isSelected ? AppColors.primary : AppColors.gray400)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(inventoryDetails.attribute.isEmpty ? "" : "${inventoryDetails.attribute[0].attributeValue} - "),
            CircleAvatar(
              backgroundColor: HexColor.fromHex(inventoryDetails.productColor.colorCode),
              radius: AppSize.s8,
            ),
            CustomText(" - ${inventoryDetails.productSize.sizeCode}"),
          ],
        ),
      ),
    );
  }
}
