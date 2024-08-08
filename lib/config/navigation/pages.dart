import '../../modules/addresses/binding/address_form_binding.dart';
import '../../modules/categories/binding/category_products_binding.dart';
import '../../modules/layout/binding/layout_binding.dart';
import '../../modules/layout/view/screens/layout_screen.dart';
import '../../modules/legal/binding/terms_and_conditions_binding.dart';
import '../../modules/legal/views/screens/terms_and_condition_screen.dart';
import '../../modules/on_boarding/binding/on_boarding_binding.dart';
import '../../modules/on_boarding/view/screens/on_boarding_screen.dart';
import '../../modules/order/binding/my_orders_binding.dart';
import '../../modules/order/binding/order_binding.dart';
import '../../modules/order/views/screens/order_screen.dart';
import '../../modules/order/views/screens/paypal_payment_screen.dart';
import '../../modules/order/views/screens/successful_order_screen.dart';
import '../../modules/payment/binding/add_payment_method_binding.dart';
import '../../modules/payment/binding/payment_methods_binding.dart';
import '../../modules/payment/view/screens/add_payment_method_screen.dart';
import '../../modules/payment/view/screens/payment_methods_screen.dart';
import '../../modules/product/binding/product_detail_binding.dart';
import '../../modules/product/views/screens/product_reviews_screen.dart';
import '../../modules/search/binding/search_binding.dart';
import '../../modules/settings/views/screens/choose_components_screen.dart';
import '../../modules/spalsh/binding/splash_binding.dart';
import 'package:get/get.dart';
import '../../modules/account/binding/account_binding.dart';
import '../../modules/account/view/screens/account_screen.dart';
import '../../modules/addresses/binding/addresses_binding.dart';
import '../../modules/addresses/binding/choose_on_map_binding.dart';
import '../../modules/addresses/view/screens/address_form_screen.dart';
import '../../modules/addresses/view/screens/addresses_screen.dart';
import '../../modules/addresses/view/screens/choose_on_map_screen.dart';
import '../../modules/auth/binding/login_binding.dart';
import '../../modules/auth/binding/registration_binding.dart';
import '../../modules/auth/view/screens/login_screen.dart';
import '../../modules/auth/view/screens/registration_screen.dart';
import '../../modules/categories/view/screens/all_categories_screen.dart';
import '../../modules/categories/view/screens/category_products_screen.dart';
import '../../modules/order/views/screens/my_orders_screen.dart';
import '../../modules/payment/binding/add_card_binding.dart';
import '../../modules/payment/view/screens/add_card_screen.dart';
import '../../modules/product/views/screens/product_details_screen.dart';
import '../../modules/search/view/screens/search_screen.dart';
import '../../modules/settings/views/screens/language_screen.dart';
import '../../modules/spalsh/view/screens/splash_screen.dart';
import 'navigation.dart';

class Pages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.splashScreen,
      binding: SplashBinding(),
      page: () => const SplashScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.onBoardingScreen,
      page: () => const OnBoardingScreen(),
      bindings: [OnBoardingBinding()],
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.chooseComponentsScreen,
      page: () => const ChooseComponentsScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      bindings: [LoginBinding()],
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.registrationScreen,
      page: () => RegistrationScreen(),
      bindings: [RegistrationBinding()],
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.layoutScreen,
      page: () => LayoutScreen(),
      bindings: [LayoutBinding()],
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.accountScreen,
      page: () => AccountScreen(),
      bindings: [AccountBinding()],
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.languageScreen,
      page: () => LanguageScreen(),
      // bindings: [LanguageBinding()],
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.paymentMethodsScreen,
      page: () => PaymentMethodsScreen(),
      bindings: [PaymentMethodsBinding()],
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.addPaymentMethodScreen,
      page: () => AddPaymentMethodScreen(),
      bindings: [AddPaymentMethodBinding()],
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.addCardScreen,
      page: () => AddCardScreen(),
      bindings: [AddCardBinding()],
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.addressesScreen,
      page: () => AddressesScreen(),
      bindings: [AddressesBinding()],
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.addressFormScreen,
      binding: AddressFormBinding(),
      page: () => AddressFormScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.chooseOnMapScreen,
      page: () => ChooseOnMapScreen(),
      bindings: [ChooseOnMapBinding()],
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.productDetailsScreen,
      binding: ProductDetailBinding(),
      page: () => ProductDetailsScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.orderScreen,
      page: () => OrderScreen(),
      bindings: [OrderBinding()],
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.myOrdersScreen,
      binding: MyOrdersBinding(),
      page: () => MyOrdersScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.successfulOrderScreen,
      page: () => SuccessfulOrderScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.allCategoriesScreen,
      page: () => AllCategoriesScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.categoryProductsScreen,
      binding: CategoryProductsBinding(),
      page: () => CategoryProductsScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.searchScreen,
      binding: SearchBinding(),
      page: () => SearchScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.termsAndConditionsScreen,
      binding: TermsAndConditionsBinding(),
      page: () => TermsAndConditionScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.productReviewsScreen,
      page: () => ProductReviewsScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.paypalPaymentScreen,
      page: () => PaypalPaymentScreen(),
      transition: Transition.cupertino,
    ),
  ];
}
