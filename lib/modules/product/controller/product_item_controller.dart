import '../../cart/repos/cart_repo.dart';
import 'package:get/get.dart';

import '../../../core/resources/resources.dart';
import '../../../core/utils/alerts.dart';
import '../../cart/models/requests/cart_product_model.dart';

class ProductItemController extends GetxController {
  final CartRepo _cartRepo;

  ProductItemController(this._cartRepo);

  Future<bool?> checkIfAddedToCart(int productId, String attributesHash) async {
    final result = await _cartRepo.checkIfAddedToCart(productId, attributesHash);
    return result.fold(
      (failure) {
        Alerts.showSnackBar(message: failure.message);
        return null;
      },
      (isAdded) => isAdded,
    );
  }

  Future<void> addProductToCart(CartProduct cartProduct) async {
    final isAdded = await checkIfAddedToCart(cartProduct.productId!, "");
    if (isAdded == null || isAdded) {
      Alerts.showToast(AppStrings.msgProductAlreadyInCart.tr);
      return;
    }
    final result = await _cartRepo.addToCart(cartProduct);
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message),
      (message) => Alerts.showToast(message),
    );
  }
}
