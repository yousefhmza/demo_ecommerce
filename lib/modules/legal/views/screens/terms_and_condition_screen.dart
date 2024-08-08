import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import '../../controllers/terms_and_conditions_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

class TermsAndConditionScreen extends GetWidget<TermsAndConditionsController> {
  const TermsAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(title: AppStrings.msgTermsConditions.tr),
      body: Obx(
        () => controller.isLoading.value
            ? const LoadingSpinner()
            : SingleChildScrollView(
                padding: const EdgeInsets.all(AppPadding.p24),
                child: HtmlWidget(controller.termsAndConditions.value),
              ),
      ),
    );
  }
}
