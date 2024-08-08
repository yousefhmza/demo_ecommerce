import '../repo/legal_repo.dart';
import 'package:get/get.dart';

import '../../../core/utils/alerts.dart';

class TermsAndConditionsController extends GetxController {
  final LegalRepo _legalRepo;

  TermsAndConditionsController(this._legalRepo);

  @override
  void onInit() {
    super.onInit();
    getTermsAndConditions();
  }

  RxBool isLoading = false.obs;
  RxString termsAndConditions = "".obs;

  Future<void> getTermsAndConditions() async {
    isLoading(true);
    final result = await _legalRepo.getTermsAndConditions();
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message),
      (termsAndConditions) => this.termsAndConditions(termsAndConditions),
    );
    isLoading(false);
  }
}
