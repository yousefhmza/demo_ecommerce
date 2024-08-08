import 'package:get/get.dart';

import '../../../core/utils/alerts.dart';
import '../models/region_model.dart';
import '../repositories/regions_repo.dart';

class RegionsController extends GetxController {
  final RegionsRepo _regionsRepo;

  RegionsController(this._regionsRepo);

  RxBool isLoadingCountries = false.obs;
  RxBool isLoadingStates = false.obs;
  RxBool isLoadingCities = false.obs;

  RxList<Region> countries = RxList<Region>([]);
  RxList<Region> states = RxList<Region>([]);
  RxList<Region> cities = RxList<Region>([]);

  Future<void> getCountries() async {
    isLoadingCountries(true);
    final result = await _regionsRepo.getCountries();
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getCountries),
      (regions) => countries(regions.data),
    );
    isLoadingCountries(false);
  }

  Future<void> getStates(int countryId) async {
    isLoadingStates(true);
    final result = await _regionsRepo.getStates(countryId);
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: () => getStates(countryId)),
      (regions) => states(regions.data),
    );
    isLoadingStates(false);
  }

  Future<void> getCities(int stateId) async {
    isLoadingCities(true);
    final result = await _regionsRepo.getCities(stateId);
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: () => getCities(stateId)),
      (regions) => cities(regions.data),
    );
    isLoadingCities(false);
  }
}
