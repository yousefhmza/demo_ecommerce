import 'dart:async';

import 'package:dartz/dartz.dart';
import '../../../core/utils/alerts.dart';
import '../models/requests/search_body.dart';
import '../models/responses/search_criteria_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/base/models/pagination_model.dart';
import '../../../core/resources/resources.dart';
import '../../../core/services/error/failure.dart';
import '../../product/models/responses/in_list_product_model.dart';
import '../repos/search_repo.dart';

class SearchController extends GetxController {
  final SearchRepo _searchRepo;

  SearchController(this._searchRepo);

  @override
  void onInit() {
    super.onInit();
    recentSearch;
  }

  Timer? _timer;
  final TextEditingController searchFieldController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  Rx<SearchBody> searchBody = SearchBody().obs;
  Rx<SearchCriteria?> searchCriteria = Rx(null);
  Rx<List<InListProductModel>> products = Rx([]);

  RxList<String> get recentSearch => _searchRepo.recentSearch.obs;

  void onInputChange(String name, {bool updateSearchFieldController = false}) {
    cancelTimer();
    searchBody.value.copyWith(name: name);
    if (updateSearchFieldController) searchFieldController.text = name;
    if (name.trim().isNotEmpty) {
      _timer = Timer(Time.t700ms, () => searchBody(searchBody.value.copyNew(searchBody.value)));
    } else {
      recentSearch;
    }
  }

  void cancelTimer() {
    if (_timer != null) _timer!.cancel();
  }

  Future<void> saveRecentSearch() async {
    if (searchBody.value.name != null && !recentSearch.contains(searchBody.value.name)) {
      _searchRepo.saveToRecentSearch(searchBody.value.name!);
    }
  }

  Future<Either<Failure, PaginationModel<InListProductModel>>> searchProducts({int page = 1}) async {
    final result = await _searchRepo.searchProducts(page: page, searchBody: searchBody.value);
    return result;
  }

  Future<void> getSearchCriteria() async {
    final result = await _searchRepo.getSearchCriteria();
    result.fold(
      (failure) => Alerts.showToast(failure.message),
      (searchCriteria) => this.searchCriteria(searchCriteria),
    );
  }
}
