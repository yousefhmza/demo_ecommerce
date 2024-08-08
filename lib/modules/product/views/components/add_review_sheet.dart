import '../../controller/product_detail_controller.dart';
import '../../models/responses/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../../../core/utils/validators.dart';
import '../../models/requests/review_body.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';

class AddReviewSheet extends StatefulWidget {
  final Product product;

  const AddReviewSheet({required this.product, super.key});

  @override
  State<AddReviewSheet> createState() => _AddReviewSheetState();
}

class _AddReviewSheetState extends State<AddReviewSheet> {
  late final ReviewBody reviewBody;
  final ProductDetailsController controller = Get.find<ProductDetailsController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    reviewBody = ReviewBody(productId: widget.product.id, rating: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          children: [
            CustomText(AppStrings.writeAReview.tr, style: Theme.of(context).textTheme.headlineSmall),
            const VerticalSpace(AppSize.s40),
            RatingBar.builder(
              initialRating: reviewBody.rating?.toDouble() ?? 0.0,
              unratedColor: AppColors.gray300,
              itemSize: AppSize.s48,
              glowColor: AppColors.ratingStar,
              itemBuilder: (context, index) => const CustomIcon.svg(AppImages.imgStar),
              onRatingUpdate: (value) => reviewBody.copyWith(rating: value.toInt()),
            ),
            const VerticalSpace(AppSize.s40),
            CustomTextField(
              maxLines: 7,
              minLines: 7,
              hintText: AppStrings.writeAReview.tr,
              validator: Validators.required,
              onChanged: (value) => reviewBody.copyWith(comment: value),
            ),
            const VerticalSpace(AppSize.s24),
            Obx(
              () => CustomButton(
                isLoading: controller.isAddingReview.value,
                text: AppStrings.postAReview.tr,
                onPressed: () {
                  if (!formKey.currentState!.validate()) return;
                  controller.addReview(reviewBody);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
