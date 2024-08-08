import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/services/responsive_service.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/view/views.dart';
import '../../controller/add_card_controller.dart';
import 'package:flutter/material.dart';

class AddCardScreen extends GetWidget<AddCardController> {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MainAppbar(title: AppStrings.lblAddCard.tr),
      body: Form(
        key: controller.formKey,
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 25.v),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1.v, bottom: 2.v),
                    child: Text(AppStrings.msgEnterCardDetails.tr, style: Get.theme.textTheme.titleMedium),
                  ),
                  CustomImage(image: AppImages.imgScanAlt2Light, height: 24.adaptSize, width: 24.adaptSize)
                ],
              ),
              SizedBox(height: 22.v),
              CustomImage(image: AppImages.imgVisaCard,fit: BoxFit.contain),
              SizedBox(height: 25.v),
              CustomTextField(
                controller: controller.nameController,
                hintText: AppStrings.msgCardHolderName.tr,
                validator: Validators.nameValidator,
                contentPadding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 16.v),
              ),
              SizedBox(height: 24.v),
              CustomTextField(
                controller: controller.cardNumberController,
                hintText: AppStrings.lblCardNumber.tr,
                keyBoardType: TextInputType.number,
                validator: Validators.numberValidator,
                contentPadding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 16.v),
              ),
              SizedBox(height: 24.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextField(
                    controller: controller.cvvController,
                    hintText: AppStrings.lblCvv.tr,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 16.v),
                  ),
                  CustomTextField(
                    controller: controller.expiryDateController,
                    hintText: AppStrings.lblExpiryDate.tr,
                    textInputAction: TextInputAction.done,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 16.v),
                  )
                ],
              ),
              SizedBox(height: 5.v)
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomButton(
        height: 40.v,
        text: AppStrings.lblSave.tr,
        margin: const EdgeInsets.all(24),
        onPressed: () {},
      ),
    );
  }
}
