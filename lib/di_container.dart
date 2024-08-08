import 'package:dio/dio.dart';
import 'config/configs/configs_repo.dart';
import 'config/localization/controller/l10n_controller.dart';
import 'modules/account/controller/account_controller.dart';
import 'modules/account/repositories/account_repo.dart';
import 'modules/addresses/controller/address_form_controller.dart';
import 'modules/addresses/controller/addresses_controller.dart';
import 'modules/addresses/controller/choose_on_map_controller.dart';
import 'modules/addresses/repos/addresses_repo.dart';
import 'modules/auth/controller/login_controller.dart';
import 'modules/auth/controller/registration_controller.dart';
import 'modules/auth/repositories/auth_repo.dart';
import 'modules/cart/controller/shopping_cart_controller.dart';
import 'modules/cart/repos/cart_repo.dart';
import 'modules/categories/controller/categories_controller.dart';
import 'modules/categories/controller/categories_drop_down_controller.dart';
import 'modules/categories/controller/category_products_controller.dart';
import 'modules/categories/repo/categories_repo.dart';
import 'modules/following/controller/following_controller.dart';
import 'modules/home/controller/home_controller.dart';
import 'modules/home/repo/home_repo.dart';
import 'modules/layout/controller/layout_controller.dart';
import 'modules/legal/controllers/terms_and_conditions_controller.dart';
import 'modules/legal/repo/legal_repo.dart';
import 'modules/on_boarding/controller/on_boarding_controller.dart';
import 'modules/on_boarding/repositories/on_boarding_repo.dart';
import 'modules/order/controller/my_orders_controller.dart';
import 'modules/order/controller/order_controller.dart';
import 'modules/order/repos/orders_repo.dart';
import 'modules/payment/controller/add_card_controller.dart';
import 'modules/payment/controller/add_payment_method_controller.dart';
import 'modules/payment/controller/payment_methods_controller.dart';
import 'modules/product/controller/product_detail_controller.dart';
import 'modules/product/controller/product_item_controller.dart';
import 'modules/product/repo/product_repo.dart';
import 'modules/regions/controllers/regions_controller.dart';
import 'modules/regions/repositories/regions_repo.dart';
import 'modules/search/repos/search_repo.dart';
import 'modules/search/controllers/search_controller.dart' as sc;
import 'modules/spalsh/controller/splash_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'core/services/local/cache_client.dart';
import 'core/services/local/cart_database.dart';
import 'core/services/network/api_client.dart';
import 'core/services/network/network_info.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // external
  await GetStorage.init();
  sl.registerLazySingleton<GetStorage>(() => GetStorage());
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<PrettyDioLogger>(
      () => PrettyDioLogger(requestHeader: true, requestBody: true, responseHeader: true));

  // core
  sl.registerLazySingleton<CacheClient>(() => CacheClient(sl<GetStorage>()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfo(sl<Connectivity>()));
  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl<Dio>(), sl<CacheClient>(), sl<PrettyDioLogger>()));

  // Local
  sl.registerLazySingleton<CartDatabase>(() => CartDatabase()..initDatabase());

  // Repositories
  sl.registerLazySingleton<ConfigsRepo>(() => ConfigsRepo(sl<ApiClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<AuthRepo>(() => AuthRepo(sl<ApiClient>(), sl<CacheClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<AccountRepo>(() => AccountRepo(sl<ApiClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepo(sl<CacheClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<RegionsRepo>(() => RegionsRepo(sl<ApiClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<LegalRepo>(() => LegalRepo(sl<ApiClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<HomeRepo>(() => HomeRepo(sl<ApiClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<CategoriesRepo>(() => CategoriesRepo(sl<ApiClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<ProductsRepo>(() => ProductsRepo(sl<ApiClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<CartRepo>(() => CartRepo(sl<CartDatabase>()));
  sl.registerLazySingleton<AddressesRepo>(() => AddressesRepo(sl<ApiClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<OrdersRepo>(() => OrdersRepo(sl<ApiClient>(), sl<NetworkInfo>()));
  sl.registerLazySingleton<SearchRepo>(() => SearchRepo(sl<ApiClient>(), sl<CacheClient>(), sl<NetworkInfo>()));

  // Controllers
  sl.registerFactory<L10nController>(() => L10nController(sl<CacheClient>()));
  sl.registerFactory<SplashController>(
    () => SplashController(sl<ConfigsRepo>(), sl<OnBoardingRepo>(), sl<AuthRepo>(), sl<AccountRepo>()),
  );
  sl.registerFactory<OnBoardingController>(() => OnBoardingController(sl<OnBoardingRepo>()));
  sl.registerFactory<RegionsController>(() => RegionsController(sl<RegionsRepo>()));
  sl.registerFactory<LoginController>(() => LoginController(sl<AuthRepo>()));
  sl.registerFactory<RegistrationController>(() => RegistrationController(sl<AuthRepo>()));
  sl.registerFactory<CategoryProductsController>(() => CategoryProductsController(sl<CategoriesRepo>()));
  sl.registerFactory<CategoriesDropDownController>(() => CategoriesDropDownController(sl<CategoriesRepo>()));
  sl.registerFactory<CategoriesController>(() => CategoriesController(sl<CategoriesRepo>()));
  sl.registerFactory<LayoutController>(() => LayoutController());
  sl.registerFactory<FollowingController>(() => FollowingController());
  sl.registerFactory<AccountController>(() => AccountController(sl<AccountRepo>()));
  sl.registerFactory<PaymentMethodsController>(() => PaymentMethodsController());
  sl.registerFactory<AddPaymentMethodController>(() => AddPaymentMethodController());
  sl.registerFactory<AddCardController>(() => AddCardController());
  sl.registerFactory<AddressFormController>(() => AddressFormController(sl<AddressesRepo>()));
  sl.registerFactory<AddressesController>(() => AddressesController(sl<AddressesRepo>()));
  sl.registerFactory<ChooseOnMapController>(() => ChooseOnMapController());
  sl.registerFactory<HomeController>(() => HomeController(sl<HomeRepo>(), sl<CategoriesRepo>()));
  sl.registerFactory<ProductItemController>(() => ProductItemController(sl<CartRepo>()));
  sl.registerFactory<ProductDetailsController>(() => ProductDetailsController(sl<ProductsRepo>(), sl<CartRepo>()));
  sl.registerFactory<CartController>(() => CartController(sl<CartRepo>()));
  sl.registerFactory<OrderController>(() => OrderController(sl<OrdersRepo>()));
  sl.registerFactory<MyOrdersController>(() => MyOrdersController(sl<OrdersRepo>()));
  sl.registerFactory<TermsAndConditionsController>(() => TermsAndConditionsController(sl<LegalRepo>()));
  sl.registerFactory<sc.SearchController>(() => sc.SearchController(sl<SearchRepo>()));
}
