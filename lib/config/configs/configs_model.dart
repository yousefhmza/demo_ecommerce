import '../../core/utils/json_utils.dart';

class ConfigsModel {
  final int productWidgetId;
  final int categoryChipWidgetId;
  final int bottomNavWidgetId;
  final int appbarWidgetId;
  final int cartItemWidgetId;
  final int productImagesSliderId;
  final int drawerId;
  final int textFieldId;

  ConfigsModel({
    required this.productWidgetId,
    required this.categoryChipWidgetId,
    required this.bottomNavWidgetId,
    required this.appbarWidgetId,
    required this.cartItemWidgetId,
    required this.productImagesSliderId,
    required this.drawerId,
    required this.textFieldId,
  });

  factory ConfigsModel.fromJson(Map<String, dynamic> json) => ConfigsModel(
        productWidgetId: JsonUtils.parseIntFromJson(json["product_widget_id"], defaultValue: 1),
        categoryChipWidgetId: JsonUtils.parseIntFromJson(json["category_chip_widget_id"], defaultValue: 1),
        bottomNavWidgetId: JsonUtils.parseIntFromJson(json["bottom_nav_widget_id"], defaultValue: 1),
        appbarWidgetId: JsonUtils.parseIntFromJson(json["appbar_widget_id"], defaultValue: 1),
        cartItemWidgetId: JsonUtils.parseIntFromJson(json["cart_item_widget_id"], defaultValue: 1),
        productImagesSliderId: JsonUtils.parseIntFromJson(json["product_images_slider_id"], defaultValue: 1),
        drawerId: JsonUtils.parseIntFromJson(json["drawer_id"], defaultValue: 1),
        textFieldId: JsonUtils.parseIntFromJson(json["text_field_id"], defaultValue: 1),
      );

  bool get theAppContainsDrawer =>
      appbarWidgetId == 1 ||
      appbarWidgetId == 2 ||
      appbarWidgetId == 3 ||
      appbarWidgetId == 5 ||
      appbarWidgetId == 7 ||
      appbarWidgetId == 8 ||
      appbarWidgetId == 9;

  Map<String, dynamic> toJson() => {
        "product_widget_id": productWidgetId,
        "category_chip_widget_id": categoryChipWidgetId,
        "bottom_nav_widget_id": bottomNavWidgetId,
        "appbar_widget_id": appbarWidgetId,
        "cart_item_widget_id": cartItemWidgetId,
        "product_images_slider_id": productImagesSliderId,
        "drawer_id": drawerId,
        "text_field_id": textFieldId,
      };
}
