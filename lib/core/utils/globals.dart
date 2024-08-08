import '../../config/configs/configs_model.dart';
import '../services/responsive_service.dart';
import '../../modules/cart/models/requests/cart_product_model.dart';
import '../../modules/categories/models/responses/category_model.dart';
import '../../modules/product/models/responses/in_list_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/cart/views/widgets/cart_items/cart_item1.dart';
import '../../modules/cart/views/widgets/cart_items/cart_item2.dart';
import '../../modules/cart/views/widgets/cart_items/cart_item3.dart';
import '../../modules/cart/views/widgets/cart_items/cart_item4.dart';
import '../../modules/cart/views/widgets/cart_items/cart_item5.dart';
import '../../modules/cart/views/widgets/cart_items/cart_item6.dart';

import '../../modules/account/models/responses/user_model.dart';
import '../../modules/categories/view/widgets/category_chip/category_chip_1.dart';
import '../../modules/categories/view/widgets/category_chip/category_chip_2.dart';
import '../../modules/categories/view/widgets/category_chip/category_chip_3.dart';
import '../../modules/categories/view/widgets/category_chip/category_chip_4.dart';
import '../../modules/categories/view/widgets/category_chip/category_chip_5.dart';
import '../../modules/categories/view/widgets/category_chip/category_chip_6.dart';
import '../../modules/categories/view/widgets/category_chip/category_chip_7.dart';
import '../../modules/categories/view/widgets/category_chip/category_chip_8.dart';
import '../../modules/categories/view/widgets/category_chip/category_chip_9.dart';
import '../../modules/categories/view/widgets/category_chip/category_chip_10.dart';

import '../../modules/home/view/components/home_appbar/home_appbar_1.dart';
import '../../modules/home/view/components/home_appbar/home_appbar_2.dart';
import '../../modules/home/view/components/home_appbar/home_appbar_3.dart';
import '../../modules/home/view/components/home_appbar/home_appbar_4.dart';
import '../../modules/home/view/components/home_appbar/home_appbar_5.dart';
import '../../modules/home/view/components/home_appbar/home_appbar_6.dart';
import '../../modules/home/view/components/home_appbar/home_appbar_7.dart';
import '../../modules/home/view/components/home_appbar/home_appbar_8.dart';
import '../../modules/home/view/components/home_appbar/home_appbar_9.dart';
import '../../modules/home/view/components/home_appbar/home_appbar_10.dart';

import '../../modules/layout/view/components/bnb/bnb_1.dart';
import '../../modules/layout/view/components/bnb/bnb_2.dart';
import '../../modules/layout/view/components/bnb/bnb_3.dart';
import '../../modules/layout/view/components/bnb/bnb_4.dart';
import '../../modules/layout/view/components/bnb/bnb_5.dart';
import '../../modules/layout/view/components/bnb/bnb_6.dart';
import '../../modules/layout/view/components/bnb/bnb_7.dart';
import '../../modules/layout/view/components/bnb/bnb_8.dart';
import '../../modules/layout/view/components/bnb/bnb_9.dart';
import '../../modules/layout/view/components/bnb/bnb_10.dart';

import '../../modules/product/views/components/product_images_slider/product_images_slider1.dart';
import '../../modules/product/views/components/product_images_slider/product_images_slider2.dart';
import '../../modules/product/views/components/product_images_slider/product_images_slider3.dart';
import '../../modules/product/views/components/product_images_slider/product_images_slider4.dart';
import '../../modules/product/views/components/product_images_slider/product_images_slider5.dart';
import '../../modules/product/views/components/product_images_slider/product_images_slider6.dart';
import '../../modules/product/views/components/product_images_slider/product_images_slider7.dart';
import '../../modules/product/views/components/product_images_slider/product_images_slider8.dart';
import '../../modules/product/views/components/product_images_slider/product_images_slider9.dart';
import '../../modules/product/views/components/product_images_slider/product_images_slider10.dart';

import '../../modules/product/views/widgets/product_item/product_item_10.dart';
import '../../modules/product/views/widgets/product_item/product_item_1.dart';
import '../../modules/product/views/widgets/product_item/product_item_2.dart';
import '../../modules/product/views/widgets/product_item/product_item_3.dart';
import '../../modules/product/views/widgets/product_item/product_item_4.dart';
import '../../modules/product/views/widgets/product_item/product_item_5.dart';
import '../../modules/product/views/widgets/product_item/product_item_6.dart';
import '../../modules/product/views/widgets/product_item/product_item_7.dart';
import '../../modules/product/views/widgets/product_item/product_item_8.dart';
import '../../modules/product/views/widgets/product_item/product_item_9.dart';

Rx<UserModel?> currentUser = Rx(null);
Rx<ConfigsModel?> configs = Rx(null);

late Settings settings;

class Settings {
  int bnbId;
  int productItem;
  int cartItem;
  int categoryChip;
  int appbar;
  int productImagesSlider;
  double? productItemHeight;
  double? productListViewHeight;
  double? productInGridAspectRatio;
  int? productInGridCrossAxisCount;
  double? categoryChipsListViewHeight;
  double? categoryChipsSpacing;

  Settings({
    required this.bnbId,
    required this.cartItem,
    required this.productItem,
    required this.categoryChip,
    required this.appbar,
    required this.productImagesSlider,
  });

  void copyWith({
    int? bnbId,
    int? cartItem,
    int? productItem,
    int? categoryChip,
    int? appbar,
    int? productImagesSlider,
    int? drawer,
  }) {
    this.bnbId = bnbId ?? this.bnbId;
    this.cartItem = cartItem ?? this.cartItem;
    this.productItem = productItem ?? this.productItem;
    this.categoryChip = categoryChip ?? this.categoryChip;
    this.appbar = appbar ?? this.appbar;
    this.productImagesSlider = productImagesSlider ?? this.productImagesSlider;
  }

  bool get theAppContainsDrawer =>
      appbar == 1 || appbar == 2 || appbar == 3 || appbar == 5 || appbar == 7 || appbar == 8 || appbar == 9;

  Widget get getBNB {
    switch (bnbId) {
      case 1:
        return BNB1();
      case 2:
        return BNB2();
      case 3:
        return SafeArea(child: BNB3());
      case 4:
        return SafeArea(child: BNB4());
      case 5:
        return SafeArea(child: BNB5());
      case 6:
        return SafeArea(child: BNB6());
      case 7:
        return SafeArea(child: BNB7());
      case 8:
        return SafeArea(child: BNB8());
      case 9:
        return BNB2();
      case 10:
        return BNB2();
      default:
        return BNB1();
    }
  }

  void initProductItemValues() {
    switch (productItem) {
      case 1:
        productItemHeight = 227.v;
        productListViewHeight = 227.v;
        productInGridAspectRatio = 0.7;
        productInGridCrossAxisCount = 2;
        break;
      case 2:
        productItemHeight = 240.v;
        productListViewHeight = 260.v;
        productInGridAspectRatio = 1.1;
        productInGridCrossAxisCount = 1;

        break;
      case 3:
        productItemHeight = 110.v;
        productListViewHeight = 130.v;
        productInGridAspectRatio = 3.0;
        productInGridCrossAxisCount = 1;

        break;
      case 4:
        productItemHeight = 110.v;
        productListViewHeight = 130.v;
        productInGridAspectRatio = 0.76;
        productInGridCrossAxisCount = 1;

        break;
      case 5:
        productItemHeight = 250.v;
        productListViewHeight = 270.v;
        productInGridAspectRatio = 0.76;
        productInGridCrossAxisCount = 2;

        break;
      case 6:
        productItemHeight = 240.v;
        productListViewHeight = 260.v;
        productInGridAspectRatio = 0.85;
        productInGridCrossAxisCount = 2;
        break;
      case 7:
        productItemHeight = 227.v;
        productListViewHeight = 227.v;
        productInGridAspectRatio = 0.7;
        productInGridCrossAxisCount = 2;
        break;
      case 8:
        productItemHeight = 250.v;
        productListViewHeight = 270.v;
        productInGridAspectRatio = 0.75;
        productInGridCrossAxisCount = 2;
        break;
      case 9:
        productItemHeight = 270.v;
        productListViewHeight = 290.v;
        productInGridAspectRatio = 0.75;
        productInGridCrossAxisCount = 2;
        break;
      case 10:
        productItemHeight = 240.v;
        productListViewHeight = 260.v;
        productInGridAspectRatio = 1.1;
        productInGridCrossAxisCount = 1;
        break;
    }
  }

  Widget getProductItem({required InListProductModel product, bool dynamicDimensions = false}) {
    switch (productItem) {
      case 1:
        return ProductItem1(product, dynamicDimensions: dynamicDimensions);
      case 2:
        return ProductItem2(product, dynamicDimensions: dynamicDimensions);
      case 3:
        return ProductItem3(product, dynamicDimensions: dynamicDimensions);
      case 4:
        return ProductItem4(product, dynamicDimensions: dynamicDimensions);
      case 5:
        return ProductItem5(product, dynamicDimensions: dynamicDimensions);
      case 6:
        return ProductItem6(product, dynamicDimensions: dynamicDimensions);
      case 7:
        return ProductItem7(product, dynamicDimensions: dynamicDimensions);
      case 8:
        return ProductItem8(product, dynamicDimensions: dynamicDimensions);
      case 9:
        return ProductItem9(product, dynamicDimensions: dynamicDimensions);
      case 10:
        return ProductItem10(product, dynamicDimensions: dynamicDimensions);
      default:
        return Container();
    }
  }

  Widget getProductImagesSlider({required List<String> images, num? price}) {
    switch (productImagesSlider) {
      case 1:
        return ProductImagesSlider1(images: images);
      case 2:
        return ProductImagesSlider2(images: images, price: price);
      case 3:
        return ProductImagesSlider3(images: images);
      case 4:
        return ProductImagesSlider4(images: images);
      case 5:
        return ProductImagesSlider5(images: images);
      case 6:
        return ProductImagesSlider6(images: images);
      case 7:
        return ProductImagesSlider7(images: images);
      case 8:
        return ProductImagesSlider8(images: images);
      case 9:
        return ProductImagesSlider9(images: images);
      case 10:
        return ProductImagesSlider10(images: images);
      default:
        return Container();
    }
  }

  void initCategoryChipsValues() {
    switch (categoryChip) {
      case 1:
        categoryChipsListViewHeight = 96.v;
        break;
      case 2:
        categoryChipsListViewHeight = 32.v;
        break;
      case 3:
        categoryChipsListViewHeight = 32.v;
        categoryChipsSpacing = 24.h;
        break;
      // categoryChipsListViewHeight = 48.v;
      // break;
      case 4:
        categoryChipsListViewHeight = 32.v;
        categoryChipsSpacing = 20.h;
        break;
      case 5:
        categoryChipsListViewHeight = 32.v;
        categoryChipsSpacing = 24.h;
        break;
      case 6:
        categoryChipsListViewHeight = 40.v;
        categoryChipsSpacing = 20.h;
        break;
      case 7:
        categoryChipsListViewHeight = 64.v;
        break;
      case 8:
        categoryChipsListViewHeight = 24.v;
        categoryChipsSpacing = 24.h;
        break;
      case 9:
        categoryChipsListViewHeight = 40.v;
        categoryChipsSpacing = 20.h;
        break;
      // categoryChipsListViewHeight = 40.v;
      // break;
      case 10:
        categoryChipsListViewHeight = 24.v;
        categoryChipsSpacing = 24.h;
        break;
      // categoryChipsListViewHeight = 40.v;
      // break;
    }
  }

  Widget getCategoryChip({required CategoryModel category, required bool isSelected, required VoidCallback onTap}) {
    switch (categoryChip) {
      case 1:
        return CategoryChip1(category: category, isSelected: isSelected, onTap: onTap);
      case 2:
        return CategoryChip2(category: category, isSelected: isSelected, onTap: onTap);
      case 3:
        return CategoryChip5(category: category, isSelected: isSelected, onTap: onTap);
      case 4:
        return CategoryChip4(category: category, isSelected: isSelected, onTap: onTap);
      case 5:
        return CategoryChip5(category: category, isSelected: isSelected, onTap: onTap);
      case 6:
        return CategoryChip6(category: category, isSelected: isSelected, onTap: onTap);
      case 7:
        return CategoryChip7(category: category, isSelected: isSelected, onTap: onTap);
      case 8:
        return CategoryChip8(category: category, isSelected: isSelected, onTap: onTap);
      case 9:
        return CategoryChip6(category: category, isSelected: isSelected, onTap: onTap);
      case 10:
        return CategoryChip8(category: category, isSelected: isSelected, onTap: onTap);
      default:
        return Container();
    }
  }

  Widget getAppbar() {
    switch (appbar) {
      case 1:
        return HomeAppbar1();
      case 2:
        return HomeAppbar2();
      case 3:
        return HomeAppbar3();
      case 4:
        return HomeAppbar4();
      case 5:
        return HomeAppbar5();
      case 6:
        return HomeAppbar6();
      case 7:
        return HomeAppbar7();
      case 8:
        return HomeAppbar8();
      case 9:
        return HomeAppbar9();
      case 10:
        return HomeAppbar10();
      default:
        return Container();
    }
  }

  Widget getCartItem({required CartProduct cartProduct}) {
    switch (cartItem) {
      case 1:
        return CartItem1(cartProduct);
      case 2:
        return CartItem2(cartProduct);
      case 3:
        return CartItem3(cartProduct);
      case 4:
        return CartItem4(cartProduct);
      case 5:
        return CartItem5(cartProduct);
      case 6:
        return CartItem6(cartProduct);
      default:
        return CartItem1(cartProduct);
    }
  }
}
