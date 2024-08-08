// ignore_for_file: prefer_typing_uninitialized_variables, prefer_collection_literals

import 'dart:convert';

import 'package:crypto/crypto.dart';

import '../../../../core/services/local/storage_keys.dart';

class CartProduct {
  int? productId;
  String? title;
  String? thumbnail;
  String? color;
  String? size;
  num? discountPrice;
  num? oldPrice;
  num? priceWithAttr;
  int? qty;
  int? category;
  int? subcategory;
  int? childCategory;
  Map<String, dynamic>? attributes;
  int? variantId;
  String? attributesHash;
  dynamic taxOSR;

  CartProduct({
    this.productId,
    this.title,
    this.thumbnail,
    this.color,
    this.size,
    this.discountPrice,
    this.oldPrice,
    this.priceWithAttr,
    this.qty,
    this.category,
    this.subcategory,
    this.childCategory,
    this.attributes,
    this.variantId,
    this.attributesHash,
    this.taxOSR,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
        productId: json[StorageKeys.productId],
        title: json[StorageKeys.title],
        thumbnail: json[StorageKeys.thumbnail],
        color: json[StorageKeys.color],
        size: json[StorageKeys.size],
        discountPrice: json[StorageKeys.discountPrice],
        oldPrice: json[StorageKeys.oldPrice],
        priceWithAttr: json[StorageKeys.priceWithAttr],
        qty: json[StorageKeys.qty],
        category: json[StorageKeys.category],
        subcategory: json[StorageKeys.subcategory],
        childCategory: json[StorageKeys.childCategory],
        attributes: jsonDecode(json[StorageKeys.attributes]),
        variantId: json[StorageKeys.variantId],
        attributesHash: json[StorageKeys.attributesHash] ?? "",
        taxOSR: json[StorageKeys.taxOptionsSumRate],
      );

  void copyWith({
    int? productId,
    String? title,
    String? thumbnail,
    String? color,
    String? size,
    num? discountPrice,
    num? oldPrice,
    num? priceWithAttr,
    int? qty,
    int? category,
    int? subcategory,
    int? childCategory,
    Map<String, dynamic>? attributes,
    int? variantId,
    String? attributesHash,
    dynamic taxOSR,
  }) {
    this.productId = productId ?? this.productId;
    this.title = title ?? this.title;
    this.thumbnail = thumbnail ?? this.thumbnail;
    this.color = color ?? this.color;
    this.size = size ?? this.size;
    this.discountPrice = discountPrice ?? this.discountPrice;
    this.oldPrice = oldPrice ?? this.oldPrice;
    this.priceWithAttr = priceWithAttr ?? this.priceWithAttr;
    this.qty = qty ?? this.qty;
    this.category = category ?? this.category;
    this.subcategory = subcategory ?? this.subcategory;
    this.childCategory = childCategory ?? this.childCategory;
    this.attributes = attributes ?? this.attributes;
    this.variantId = variantId ?? this.variantId;
    this.attributesHash = attributesHash ?? this.attributesHash;
    this.taxOSR = taxOSR ?? this.taxOSR;
  }

  Map<String, dynamic> toJson() {
    return {
      StorageKeys.productId: productId,
      StorageKeys.title: title,
      StorageKeys.thumbnail: thumbnail,
      StorageKeys.discountPrice: discountPrice,
      StorageKeys.oldPrice: oldPrice,
      StorageKeys.priceWithAttr: priceWithAttr,
      StorageKeys.qty: qty,
      StorageKeys.color: color,
      StorageKeys.size: size,
      StorageKeys.category: category,
      StorageKeys.subcategory: subcategory,
      StorageKeys.childCategory: childCategory,
      StorageKeys.attributes: jsonEncode(attributes),
      StorageKeys.variantId: variantId,
      StorageKeys.attributesHash: attributesHash ?? "",
      StorageKeys.taxOptionsSumRate: taxOSR,
    };
  }

  Map<String, Map<String, dynamic>> toOrderJson() {
    final String rowId = md5.convert(utf8.encode(productId.toString() + attributes.toString())).toString();
    return {
      rowId: {
        "rowId": rowId,
        "id": productId,
        "name": title,
        "qty": qty,
        "price": priceWithAttr ?? discountPrice,
        "options": {
          "variant_id": variantId,
          if (attributes?["Color"] != null) "color_name": attributes!["Color"],
          if (attributes?["color_code"] != null) "color_code": attributes!["color_code"],
          if (attributes?["Size"] != null) "size_name": attributes!["Size"],
          "attributes": jsonEncode(attributes ?? {}),
          "image": thumbnail,
          "used_categories": {
            if (category != null) "category": category,
            if (subcategory != null) "subcategory": subcategory,
            if (childCategory != null) "childcategory": childCategory,
          }
        },
        "discount": 0,
        "tax": 0,
        "subtotal": (priceWithAttr ?? discountPrice ?? 1) * (qty ?? 12)
      }
    };
  }
}
