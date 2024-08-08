import '../../../../core/resources/app_values.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import '../../models/responses/product_review_model.dart';
import '../widgets/review_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductReview> reviews = Get.arguments["reviews"];
    return Scaffold(
      appBar: MainAppbar(title: AppStrings.lblReviews102.tr),
      body: ListView.separated(
        padding: const EdgeInsets.all(AppPadding.p16),
        itemBuilder: (context, index) => ReviewItem(reviews[index]),
        separatorBuilder: (context, index) => const Divider(height: AppSize.s24),
        itemCount: reviews.length,
      ),
    );
  }
}
