import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/utils/sheets.dart';
import '../../../../core/view/views.dart';

class PickProfileImageComponent extends StatelessWidget {
  final Widget icon;
  final dynamic image;
  final void Function(File? image) onPickImage;

  const PickProfileImageComponent({required this.icon, this.image, required this.onPickImage, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppSheets.showBottomSheet(
        context,
        showCupertino: Platform.isIOS,
        child: PickImageSheet(onPickImage: onPickImage),
      ),
      child: SizedBox(
        width: AppSize.s125 + AppSize.s12,
        height: AppSize.s125 + AppSize.s12,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: image is File
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(AppSize.s12),
                      child: Image.file(image, width: AppSize.s125, height: AppSize.s125, fit: BoxFit.cover),
                    )
                  : CustomImage(
                      image: image ?? AppImages.placeholder,
                      width: AppSize.s125,
                      height: AppSize.s125,
                      borderRadius: AppSize.s12,
                    ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Container(
                height: AppSize.s32,
                width: AppSize.s32,
                clipBehavior: Clip.antiAlias,
                foregroundDecoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(AppSize.s350)),
                  border: Border.all(color: AppColors.white, width: AppSize.s3),
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: const BorderRadius.all(Radius.circular(AppSize.s350)),
                  border: Border.all(color: AppColors.white, width: AppSize.s3),
                ),
                child: Center(child: icon),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
