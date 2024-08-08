import '../../../../core/view/views.dart';
import '../../controller/product_detail_controller.dart';
import '../../models/responses/product_model.dart';
import '../widgets/attribute_chip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';

class ProductAttributesComponent extends GetWidget<ProductDetailsController> {
  final Product product;

  const ProductAttributesComponent(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    if (product.inventoryDetail.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            "${AppStrings.lblAttributes.tr}: ",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: FontSize.s16),
          ),
          const VerticalSpace(AppSize.s24),
          StatefulBuilder(
            builder: (context, setState) => Row(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => AttributeChip(
                      inventoryDetails: product.inventoryDetail[index],
                      isSelected: product.inventoryDetail[index].id == controller.cartProduct.variantId,
                      onTap: () {
                        final selectedAdditionalInfoStoreIndex = controller.product.value!.additionalInfoStore?.values
                            .toList()
                            .indexWhere((info) => info.pidId == product.inventoryDetail[index].id);
                        if (selectedAdditionalInfoStoreIndex == null || selectedAdditionalInfoStoreIndex == -1) return;

                        final String? selectedInventoryHash = controller.product.value!.additionalInfoStore?.keys
                            .toList()[selectedAdditionalInfoStoreIndex];
                        if (selectedInventoryHash == null) return;

                        final int attributeIndex = controller.product.value!.productInventorySet
                            .indexWhere((element) => element["hash"] == selectedInventoryHash);

                        setState(() {
                          controller.cartProduct.copyWith(
                            thumbnail: product.inventoryDetail[index].attrImage.path,
                            variantId: product.inventoryDetail[index].id,
                            priceWithAttr: product.salePrice + product.inventoryDetail[index].additionalPrice,
                            color: product.inventoryDetail[index].productColor.colorCode,
                            size: product.inventoryDetail[index].productSize.sizeCode,
                            attributesHash: selectedInventoryHash,
                            attributes: attributeIndex == -1
                                ? {}
                                : controller.product.value!.productInventorySet[attributeIndex],
                          );
                        });
                      },
                    ),
                    separatorBuilder: (context, index) => const VerticalSpace(AppSize.s16),
                    itemCount: product.inventoryDetail.length,
                  ),
                ),
                const HorizontalSpace(AppSize.s32),
                Expanded(
                  child: controller.cartProduct.thumbnail == null
                      ? Container()
                      : AspectRatio(
                          aspectRatio: 1,
                          child: CustomImage(image: controller.cartProduct.thumbnail!, borderRadius: AppSize.s16),
                        ),
                ),
              ],
            ),
          ),
          const Divider(height: AppSize.s48, indent: AppPadding.p20, endIndent: AppPadding.p20),
        ],
      ),
    );
  }
}
