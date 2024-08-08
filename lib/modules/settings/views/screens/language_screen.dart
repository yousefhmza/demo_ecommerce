import '../../../../config/localization/controller/l10n_controller.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/services/responsive_service.dart';
import '../../../../core/view/views.dart';
import '../widgets/lang_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(title: AppStrings.lblLanguage.tr),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 24.v),
        child: Column(
          children: [
            LangItem(language: "العربية"),
            LangItem(language: "English", isSelected: true),
          ],
        ),
      ),
    );
  }
}
