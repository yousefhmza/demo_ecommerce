import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import '../../resources/resources.dart';
import '../views.dart';

import '../../base/models/pagination_model.dart';
import '../../services/error/failure.dart';
import '../../utils/alerts.dart';

class PaginatedGridView<T> extends StatefulWidget {
  final Future<dartz.Either<Failure, PaginationModel<T>>> Function(int page) fetchData;
  final void Function(List<T> items) onListItemsChange;
  final Widget Function(int index) child;
  final EdgeInsetsGeometry padding;
  final bool reversedResults;
  final bool fetchOnScrollToMaxExtent;
  final bool shrinkWrap;
  final int crossAxisCount;
  final double childAspectRatio;
  final ScrollController? scrollController;

  const PaginatedGridView({
    required this.fetchData,
    required this.onListItemsChange,
    required this.child,
    required this.crossAxisCount,
    required this.childAspectRatio,
    this.padding = EdgeInsets.zero,
    this.reversedResults = false,
    this.fetchOnScrollToMaxExtent = true,
    this.shrinkWrap = false,
    this.scrollController,
    super.key,
  });

  @override
  State<PaginatedGridView> createState() => _PaginatedGridViewState<T>();
}

class _PaginatedGridViewState<T> extends State<PaginatedGridView<T>> {
  bool isLoading = false;
  int page = 1;
  bool canFetchMore = true;
  late final ScrollController scrollController;
  final List<T> listItems = [];

  @override
  void initState() {
    super.initState();
    setupController();
    getData(firstFetch: true);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void setupController() {
    scrollController = widget.scrollController ?? ScrollController();
    if (widget.fetchOnScrollToMaxExtent) {
      scrollController.addListener(() {
        final bool atEdge = scrollController.position.atEdge;
        if (atEdge && scrollController.position.pixels != 0 && canFetchMore) getData(firstFetch: false);
      });
    }
  }

  Future<void> getData({required bool firstFetch}) async {
    if (firstFetch) {
      page = 1;
      canFetchMore = true;
    }
    if (isLoading || !canFetchMore) return;
    if (page == 1) widget.onListItemsChange([]);
    if (mounted) setState(() => isLoading = true);
    final dartz.Either<Failure, PaginationModel<T>> result = await widget.fetchData(page);
    result.fold(
      (failure) => Alerts.showSnackBar(
        message: failure.message,
        onActionPressed: () => getData(firstFetch: firstFetch),
      ),
      (paginationModel) {
        final data = widget.reversedResults ? paginationModel.data.reversed.toList() : paginationModel.data;
        if (mounted) setState(() => listItems.addAll(data));
        page++;
        if (paginationModel.currentPage == paginationModel.lastPage) canFetchMore = false;
        widget.onListItemsChange(listItems);
      },
    );
    if (mounted) setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading && page == 1) return const LoadingSpinner();
    final bool isFetchingData = isLoading && page != 1;
    return GridView.builder(
      controller: scrollController,
      shrinkWrap: widget.shrinkWrap,
      padding: widget.padding,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
        childAspectRatio: widget.childAspectRatio,
        crossAxisSpacing: AppSize.s8,
        mainAxisSpacing: AppSize.s8,
      ),
      itemCount: isFetchingData ? listItems.length + 1 : listItems.length,
      itemBuilder: (context, index) =>
          isFetchingData && index == listItems.length ? const LoadingSpinner() : widget.child(index),
    );
  }
}
