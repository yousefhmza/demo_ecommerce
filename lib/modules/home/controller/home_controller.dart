import '../models/responses/slider_item_model.dart';
import 'package:get/get.dart';

import '../../../core/utils/alerts.dart';
import '../../categories/models/responses/category_model.dart';
import '../../categories/repo/categories_repo.dart';
import '../../product/models/responses/in_list_product_model.dart';
import '../repo/home_repo.dart';

class HomeController extends GetxController {
  final HomeRepo _homeRepo;
  final CategoriesRepo _categoriesRepo;

  HomeController(this._homeRepo, this._categoriesRepo);

  @override
  void onInit() {
    super.onInit();
    getSliders();
    getCategories();
    getRecentProducts();
    getFeaturedProducts();
  }

  Rx<int> sliderIndex = 0.obs;
  RxList<SliderItemModel> sliders = <SliderItemModel>[].obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxList<InListProductModel> recentProducts = <InListProductModel>[].obs;
  RxList<InListProductModel> featuredProducts = <InListProductModel>[].obs;

  Future<void> getSliders() async {
    sliders.clear();
    final result = await _homeRepo.getHomeSliderItems();
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getSliders),
      (sliders) => this.sliders(sliders),
    );
  }

  Future<void> getCategories() async {
    categories.clear();
    final result = await _categoriesRepo.getAllCategories();
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getCategories),
      (categories) => this.categories(categories),
    );
  }

  Future<void> getRecentProducts() async {
    recentProducts.clear();
    final result = await _homeRepo.getRecentProducts();
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getRecentProducts),
      (products) => recentProducts(products.data),
    );
  }

  Future<void> getFeaturedProducts() async {
    featuredProducts.clear();
    final result = await _homeRepo.getFeaturedProducts();
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getFeaturedProducts),
      (products) => featuredProducts(products.data),
    );
  }
}
