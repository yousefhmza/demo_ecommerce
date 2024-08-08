import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/services/responsive_service.dart';
import '../../../../core/view/views.dart';
import '../../models/responses/in_list_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimilarProductItem extends StatelessWidget {
  final InListProductModel product;

  const SimilarProductItem(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Get.offNamed(Routes.productDetailsScreen, arguments: {"id": product.prodId}, preventDuplicates: false),
      child: Container(
        width: AppSize.s150.h,
        height: AppSize.s225.v,
        padding: const EdgeInsets.all(AppPadding.p12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSize.s16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Center(child: CustomImage(image: product.imgUrl, fit: BoxFit.contain))),
            const VerticalSpace(AppSize.s20),
            CustomText(product.title),
            const VerticalSpace(AppSize.s4),
            CustomText(
              "${AppStrings.usd.tr} ${product.discountPrice.toStringAsFixed(1)}",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeightManager.bold,
                    fontSize: FontSize.s12,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
