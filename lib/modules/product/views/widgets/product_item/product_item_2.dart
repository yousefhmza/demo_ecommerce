import '../../../../../config/navigation/navigation.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/services/responsive_service.dart';
import '../../../../cart/models/requests/cart_product_model.dart';
import '../../../controller/product_item_controller.dart';
import '../../../models/responses/in_list_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/theme/theme.dart';
import '../../../../../core/view/views.dart';
import '../../../../../di_container.dart';

class ProductItem2 extends StatelessWidget {
  final InListProductModel product;
  final bool dynamicDimensions;

  const ProductItem2(this.product, {this.dynamicDimensions = false, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: sl<ProductItemController>(),
      builder: (controller) => Align(
        alignment: AlignmentDirectional.topCenter,
        child: GestureDetector(
          onTap: () => Get.toNamed(Routes.productDetailsScreen, arguments: {"id": product.prodId}),
          child: Container(
            width: dynamicDimensions ? double.infinity : 266.h,
            height: dynamicDimensions ? double.infinity : 240.v,
            margin: const EdgeInsets.only(top: 8),
            clipBehavior: Clip.antiAlias,
            foregroundDecoration: BoxDecoration(borderRadius: BorderRadius.circular(AppSize.s14)),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppSize.s14),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.07),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      CustomImage(image: product.imgUrl, width: double.infinity, height: double.infinity),
                      Padding(
                        padding: const EdgeInsets.all(AppPadding.p12),
                        child: Row(
                          children: [
                            product.discountPrice < product.price
                                ? Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: AppPadding.p4, horizontal: AppPadding.p12),
                                    decoration: const ShapeDecoration(shape: StadiumBorder(), color: AppColors.black),
                                    child: CustomText(
                                      "${100 - ((double.parse(product.discountPrice.toString()) / double.parse(product.price.toString())) * 100).floor()}%",
                                      style: Get.theme.textTheme.labelLarge?.copyWith(
                                        fontWeight: FontWeightManager.medium,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.all(AppPadding.p4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.white.withOpacity(0.5),
                              ),
                              child: const CustomImage(
                                image: AppImages.imgFavoriteLight,
                                width: AppSize.s20,
                                height: AppSize.s20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(AppPadding.p12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomText(
                              product.title,
                              maxLines: 1,
                              autoSized: true,
                              style: Get.theme.textTheme.titleMedium
                                  ?.copyWith(color: AppColors.primary, fontSize: FontSize.s14),
                            ),
                          ),
                          CustomImage(
                            image: AppImages.imgStar,
                            height: AppSize.s14.adaptSize,
                            width: AppSize.s14.adaptSize,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 3.h),
                            child: Text(product.avgRatting.toStringAsFixed(1), style: CustomTextStyles.bodySmallCairo),
                          ),
                        ],
                      ),
                      VerticalSpace(AppSize.s4.v),
                      CustomText(
                        product.vendorName,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        autoSized: true,
                        style:
                            Get.theme.textTheme.titleSmall?.copyWith(color: AppColors.gray400, fontSize: FontSize.s10),
                      ),
                      VerticalSpace(AppSize.s4.v),
                      const Divider(),
                      VerticalSpace(AppSize.s4.v),
                      Row(
                        children: [
                          Expanded(
                            child: CustomText(
                              "\$${product.price}",
                              style: Get.theme.textTheme.titleMedium?.copyWith(fontSize: FontSize.s18.adaptSize),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (product.isCartAble) {
                                final cartProduct = CartProduct(
                                  thumbnail: product.imgUrl,
                                  productId: product.prodId,
                                  category: product.categoryId,
                                  subcategory: product.subCategoryId,
                                  childCategory: product.childCategoryIds.isEmpty ? 0 : product.childCategoryIds[0],
                                  discountPrice: product.discountPrice,
                                  oldPrice: product.price,
                                  title: product.title,
                                  taxOSR: product.taxOSR,
                                  qty: 1,
                                );
                                controller.addProductToCart(cartProduct);
                              } else {
                                Get.toNamed(Routes.productDetailsScreen, arguments: {"id": product.prodId});
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(AppPadding.p6),
                              decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.black),
                              child: const CustomImage(
                                image: AppImages.imgAddButton,
                                width: AppSize.s24,
                                height: AppSize.s24,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
