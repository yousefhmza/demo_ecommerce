import '../../../../core/resources/resources.dart';
import '../../../../core/services/responsive_service.dart';
import '../../../../core/view/views.dart';
import '../../controller/product_detail_controller.dart';
import '../widgets/similar_product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimilarProductsComponent extends GetWidget<ProductDetailsController> {
  const SimilarProductsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray100,
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
            child: CustomText(
              AppStrings.msgSimilarProducts.tr,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: FontSize.s16,
                fontWeight: FontWeightManager.regular,
              ),
            ),
          ),
          const VerticalSpace(AppSize.s20),
          SizedBox(
            height: AppSize.s225.v,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
              itemBuilder: (context, index) => SimilarProductItem(controller.product.value!.relatedProducts[index]),
              separatorBuilder: (context, index) => const HorizontalSpace(AppSize.s12),
              itemCount: controller.product.value!.relatedProducts.length,
            ),
          )
        ],
      ),
    );
  }
}
