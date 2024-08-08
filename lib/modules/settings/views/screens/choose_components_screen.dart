import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/utils/globals.dart';
import '../../../../core/view/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseComponentsScreen extends StatelessWidget {
  const ChooseComponentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(AppPadding.p24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CustomText("Choose components", style: Get.theme.textTheme.headlineMedium),
                ),
                VerticalSpace(AppSize.s12),
                CustomText("Product item"),
                VerticalSpace(AppSize.s8),
                CustomDropDownField<int>(
                  hintText: "Product item",
                  onChanged: (value) => settings.copyWith(productItem: value),
                  items: List.generate(
                    10,
                    (index) => DropdownMenuItem(
                      value: index + 1,
                      child: CustomText((index + 1).toString()),
                    ),
                  ),
                ),
                VerticalSpace(AppSize.s12),
                CustomText("Appbar"),
                VerticalSpace(AppSize.s8),
                CustomDropDownField(
                  hintText: "Appbar",
                  onChanged: (value) => settings.copyWith(appbar: value),
                  items: List.generate(
                    10,
                    (index) => DropdownMenuItem(
                      value: index + 1,
                      child: CustomText((index + 1).toString()),
                    ),
                  ),
                ),
                VerticalSpace(AppSize.s12),
                CustomText("Category chip"),
                VerticalSpace(AppSize.s8),
                CustomDropDownField(
                  hintText: "Category chip",
                  onChanged: (value) => settings.copyWith(categoryChip: value),
                  items: List.generate(
                    10,
                    (index) => DropdownMenuItem(
                      value: index + 1,
                      child: CustomText((index + 1).toString()),
                    ),
                  ),
                ),
                VerticalSpace(AppSize.s12),
                CustomText("Cart item"),
                VerticalSpace(AppSize.s8),
                CustomDropDownField<int>(
                  hintText: "Cart item",
                  onChanged: (value) => settings.copyWith(cartItem: value),
                  items: List.generate(
                    6,
                    (index) => DropdownMenuItem(
                      value: index + 1,
                      child: CustomText((index + 1).toString()),
                    ),
                  ),
                ),
                VerticalSpace(AppSize.s12),
                CustomText("Bottom navigation"),
                VerticalSpace(AppSize.s8),
                CustomDropDownField(
                  hintText: "Bottom navigation",
                  onChanged: (value) => settings.copyWith(bnbId: value),
                  items: List.generate(
                    10,
                    (index) => DropdownMenuItem(
                      value: index + 1,
                      child: CustomText((index + 1).toString()),
                    ),
                  ),
                ),
                VerticalSpace(AppSize.s12),
                CustomText("Product images slider"),
                VerticalSpace(AppSize.s8),
                CustomDropDownField(
                  hintText: "Product images slider",
                  onChanged: (value) => settings.copyWith(productImagesSlider: value),
                  items: List.generate(
                    10,
                    (index) => DropdownMenuItem(
                      value: index + 1,
                      child: CustomText((index + 1).toString()),
                    ),
                  ),
                ),
                VerticalSpace(AppSize.s12),
                CustomText("Drawer"),
                VerticalSpace(AppSize.s8),
                CustomDropDownField(
                  hintText: "Drawer",
                  onChanged: (value) => settings.copyWith(drawer: value),
                  items: List.generate(
                    5,
                    (index) => DropdownMenuItem(
                      value: index + 1,
                      child: CustomText((index + 1).toString()),
                    ),
                  ),
                ),
                VerticalSpace(AppSize.s40),
                CustomButton(
                  text: AppStrings.lblContinue.tr,
                  onPressed: () => Get.offAllNamed(Routes.layoutScreen),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
