import '../../../core/utils/alerts.dart';
import 'package:get/get.dart';

import '../models/requests/cart_product_model.dart';
import '../repos/cart_repo.dart';

class CartController extends GetxController {
  final CartRepo _cartRepo;

  CartController(this._cartRepo);

  final RxList<CartProduct> _cartProductsList = <CartProduct>[].obs;

  RxList<CartProduct> get cartProductsList => _cartProductsList;

  final RxDouble _totalPrice = 0.0.obs;

  RxDouble get totalPrice => _totalPrice;

  Future<void> getCartProducts() async {
    final result = await _cartRepo.getCartProducts();
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message),
      (products) {
        _cartProductsList(products);
        _getTotalPrice();
      },
    );
  }

  Future<void> increaseQuantity(int productId, String attributesHash) async {
    final int index = _cartProductsList
        .indexWhere((product) => product.productId == productId && product.attributesHash == attributesHash);
    _cartProductsList[index].copyWith(qty: _cartProductsList[index].qty! + 1);
    _cartProductsList.refresh();
    _getTotalPrice();
    final result = await _cartRepo.updateCartProduct(_cartProductsList[index]);
    result.fold(
      (failure) {
        Alerts.showSnackBar(message: failure.message);
        _cartProductsList[index].copyWith(qty: _cartProductsList[index].qty! - 1);
        _cartProductsList.refresh();
        _getTotalPrice();
      },
      (message) {},
    );
  }

  Future<void> decreaseQuantity(int productId, String attributesHash) async {
    final int index = _cartProductsList
        .indexWhere((product) => product.productId == productId && product.attributesHash == attributesHash);
    if (_cartProductsList[index].qty! < 2) return;
    _cartProductsList[index].copyWith(qty: _cartProductsList[index].qty! - 1);
    _cartProductsList.refresh();
    _getTotalPrice();
    final result = await _cartRepo.updateCartProduct(_cartProductsList[index]);
    result.fold(
      (failure) {
        Alerts.showSnackBar(message: failure.message);
        _cartProductsList[index].copyWith(qty: _cartProductsList[index].qty! + 1);
        _cartProductsList.refresh();
        _getTotalPrice();
      },
      (message) {},
    );
  }

  Future<void> deleteProduct(int productId, String attributesHash) async {
    final CartProduct cartProduct = _cartProductsList
        .singleWhere((product) => product.productId == productId && product.attributesHash == attributesHash);
    final result = await _cartRepo.deleteCartProduct(cartProduct.productId!, attributesHash);
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message),
      (products) {
        _cartProductsList.removeWhere((product) =>
            product.productId == cartProduct.productId && product.attributesHash == cartProduct.attributesHash);
        _cartProductsList.refresh();
        _getTotalPrice();
      },
    );
  }

  Future<void> clearCart() async {
    final result = await _cartRepo.clearCart();
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message),
      (message) {
        _cartProductsList.clear();
        _cartProductsList.refresh();
        _getTotalPrice();
      },
    );
  }

  void _getTotalPrice() {
    final double totalPrice = _cartProductsList.fold<double>(
      0.0,
      (previousValue, cartProduct) =>
          previousValue +
          (double.parse(cartProduct.priceWithAttr?.toString() ?? cartProduct.discountPrice!.toString()) *
              cartProduct.qty!),
    );
    _totalPrice(totalPrice);
  }
}
