import '../../../config/configs/configs_repo.dart';
import '../../account/repositories/account_repo.dart';
import 'package:get/get.dart';

import '../../../config/navigation/navigation.dart';
import '../../../core/resources/resources.dart';
import '../../../core/utils/alerts.dart';
import '../../../core/utils/globals.dart';
import '../../auth/repositories/auth_repo.dart';
import '../../on_boarding/repositories/on_boarding_repo.dart';

class SplashController extends GetxController {
  final ConfigsRepo _configsRepo;
  final OnBoardingRepo _onBoardingRepo;
  final AuthRepo _authRepo;
  final AccountRepo _accountRepo;

  SplashController(this._configsRepo, this._onBoardingRepo, this._authRepo, this._accountRepo);

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Time.t3s, getConfigs);
  }

  void fetchAndRedirect() {
    if (_onBoardingRepo.onBoardingSeen) {
      if (_authRepo.isAuthed) {
        getProfile();
      } else {
        Get.offAllNamed(Routes.layoutScreen);
      }
    } else {
      Get.offAllNamed(Routes.onBoardingScreen);
    }
  }

  Future<void> getConfigs() async {
    isLoading(true);
    final result = await _configsRepo.getConfigs();
    result.fold(
      (failure) {
        Alerts.showSnackBar(message: failure.message, onActionPressed: getConfigs);
        isLoading(false);
      },
      (appConfigs) {
        print(appConfigs.toJson());
        configs(appConfigs);
        // TODO: Remove the settings Object from the app
        settings = Settings(
          bnbId: appConfigs.bottomNavWidgetId,
          cartItem: appConfigs.cartItemWidgetId,
          productItem: appConfigs.productWidgetId,
          categoryChip: appConfigs.categoryChipWidgetId,
          appbar: appConfigs.appbarWidgetId,
          productImagesSlider: appConfigs.productImagesSliderId,
        );
        fetchAndRedirect();
      },
    );
  }

  Future<void> getProfile() async {
    final result = await _accountRepo.getProfile();
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getProfile),
      (user) {
        currentUser(user);
        Get.offAllNamed(Routes.layoutScreen);
      },
    );
    isLoading(false);
  }
}
