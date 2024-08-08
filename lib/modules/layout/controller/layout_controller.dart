import '../../../core/resources/resources.dart';
import '../../../core/utils/globals.dart';
import '../../cart/views/screens/cart_screen.dart';
import '../../categories/view/screens/categories_screen.dart';
import '../../following/view/screens/following_screen.dart';
import '../../home/view/screens/home_screen.dart';
import '../../settings/views/screens/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/bnb_item_model.dart';

class LayoutController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final List<BNBItemModel> bnbItemsList = [
    BNBItemModel(
      icon: AppImages.imgHome,
      activeIcon: settings.bnbId == 1 ? AppImages.imgHomePrimary : AppImages.imgHomePrimary /*Filled*/,
      title: AppStrings.lblHome.tr,
    ),
    BNBItemModel(
      icon: AppImages.imgNavCategories,
      activeIcon:
          settings.bnbId == 1 ? AppImages.imgNavCategoriesPrimary : AppImages.imgNavCategoriesPrimary /*Filled*/,
      title: AppStrings.lblCategories.tr,
    ),
    BNBItemModel(
      icon: AppImages.imgNavFollowing,
      activeIcon: settings.bnbId == 1 ? AppImages.imgNavFollowingPrimary : AppImages.imgNavFollowingPrimary /*Filled*/,
      title: AppStrings.lblFollowing.tr,
    ),
    BNBItemModel(
      icon: AppImages.imgNavCart,
      activeIcon: settings.bnbId == 1 ? AppImages.imgNavCartPrimary : AppImages.imgNavCartPrimary /*Filled*/,
      title: AppStrings.lblCart.tr,
    ),
    if (!settings.theAppContainsDrawer)
      BNBItemModel(
        icon: AppImages.imgNavAccount,
        activeIcon: settings.bnbId == 1 ? AppImages.imgNavAccountPrimary : AppImages.imgNavAccountFilled /*Filled*/,
        title: AppStrings.lblAccount.tr,
      )
  ];

  @override
  void onInit() {
    super.onInit();
    settings.initProductItemValues();
    settings.initCategoryChipsValues();
  }

  final List<Widget> screens = [
    HomeScreen(),
    CategoriesScreen(),
    FollowingScreen(),
    CartScreen(),
    if (!settings.theAppContainsDrawer) SettingsScreen(),
  ];
}
