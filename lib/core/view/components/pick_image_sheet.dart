import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../resources/resources.dart';
import '../../utils/pickers.dart';
import '../views.dart';

class PickImageSheet extends BasePlatformWidget<Column, CupertinoActionSheet> {
  final void Function(File? image) onPickImage;
  final void Function(List<File> images)? onPickMultipleImages;

  const PickImageSheet({required this.onPickImage, this.onPickMultipleImages, super.key});

  @override
  CupertinoActionSheet createCupertinoWidget(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        if (onPickMultipleImages != null)
          CupertinoActionSheetAction(
            child: CustomText(AppStrings.moreThanOneImage.tr),
            onPressed: () async {
              final List<File> images = await Pickers.pickMultiImages();
              Get.back();
              onPickMultipleImages!(images);
            },
          ),
        CupertinoActionSheetAction(
          child: CustomText(AppStrings.gallery.tr, style: Theme.of(context).textTheme.bodyLarge),
          onPressed: () async {
            final File? image = await Pickers.pickImage(ImageSource.gallery);
            Get.back();
            onPickImage(image);
          },
        ),
        CupertinoActionSheetAction(
          child: CustomText(AppStrings.camera.tr, style: Theme.of(context).textTheme.bodyLarge),
          onPressed: () async {
            final File? image = await Pickers.pickImage(ImageSource.camera);
            Get.back();
            onPickImage(image);
          },
        ),
        CupertinoActionSheetAction(
          child: CustomText(
            AppStrings.cancel.tr,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.error),
          ),
          onPressed: () => Get.back(),
        ),
      ],
    );
  }

  @override
  Column createMaterialWidget(BuildContext context) {
    return Column(
      children: [
        if (onPickMultipleImages != null)
          CustomButton(
            isOutlined: true,
            onPressed: () async {
              final List<File> images = await Pickers.pickMultiImages();
              Get.back();
              onPickMultipleImages!(images);
            },
            child: Row(
              children: [
                const CustomIcon(Icons.image, color: AppColors.grey),
                const HorizontalSpace(AppSize.s8),
                CustomText(AppStrings.moreThanOneImage.tr)
              ],
            ),
          ),
        if (onPickMultipleImages != null) const VerticalSpace(AppSize.s12),
        CustomButton(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p10, horizontal: AppPadding.p8),
          isOutlined: true,
          // color: AppColors.black,
          onPressed: () async {
            final File? image = await Pickers.pickImage(ImageSource.gallery);
            Get.back();
            onPickImage(image);
          },
          child: Row(
            children: [
              const CustomIcon(Icons.image, color: AppColors.primary),
              const HorizontalSpace(AppSize.s8),
              CustomText(AppStrings.gallery.tr, style: Theme.of(context).textTheme.bodyLarge)
            ],
          ),
        ),
        const VerticalSpace(AppSize.s12),
        CustomButton(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p10, horizontal: AppPadding.p8),
          isOutlined: true,
          onPressed: () async {
            final File? image = await Pickers.pickImage(ImageSource.camera);
            Get.back();
            onPickImage(image);
          },
          child: Row(
            children: [
              const CustomIcon(Icons.camera, color: AppColors.primary),
              const HorizontalSpace(AppSize.s8),
              CustomText(AppStrings.camera.tr, style: Theme.of(context).textTheme.bodyLarge)
            ],
          ),
        ),
        const VerticalSpace(AppSize.s12),
        CustomButton(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p10, horizontal: AppPadding.p8),
          onPressed: () => Get.back(),
          color: AppColors.error,
          child: Row(
            children: [
              const CustomIcon(Icons.cancel, color: AppColors.white),
              const HorizontalSpace(AppSize.s8),
              CustomText(
                AppStrings.cancel.tr,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.white),
              )
            ],
          ),
        ),
      ],
    );
  }
}
