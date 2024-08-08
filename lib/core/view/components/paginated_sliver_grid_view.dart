import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import '../../resources/resources.dart';
import '../views.dart';

import '../../base/models/pagination_model.dart';
import '../../services/error/failure.dart';
import '../../utils/alerts.dart';

class PaginatedSliverGridView<T> extends StatefulWidget {
  final Future<dartz.Either<Failure, PaginationModel<T>>> Function(int page) fetchData;
  final void Function(List<T> items) onListItemsChange;
  final Widget Function(int index) child;
  final EdgeInsetsGeometry padding;
  final bool fetchOnScrollToMaxExtent;
  final ScrollController? scrollController;
  final int crossAxisCount;
  final double childAspectRatio;

  const PaginatedSliverGridView({
    required this.fetchData,
    required this.onListItemsChange,
    required this.child,
    required this.crossAxisCount,
    required this.childAspectRatio,
    this.padding = EdgeInsets.zero,
    this.fetchOnScrollToMaxExtent = true,
    this.scrollController,
    super.key,
  });

  @override
  State<PaginatedSliverGridView> createState() => _PaginatedSliverGridViewState<T>();
}

class _PaginatedSliverGridViewState<T> extends State<PaginatedSliverGridView<T>> {
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

  void setupController() {
    scrollController = widget.scrollController ?? ScrollController();
    if (widget.fetchOnScrollToMaxExtent && mounted) {
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
    setState(() => isLoading = true);
    final dartz.Either<Failure, PaginationModel<T>> result = await widget.fetchData(page);
    result.fold(
      (failure) => Alerts.showSnackBar(
        message: failure.message,
        onActionPressed: () => getData(firstFetch: firstFetch),
      ),
      (paginationModel) {
        setState(() => listItems.addAll(paginationModel.data));
        page++;
        if (paginationModel.currentPage == paginationModel.lastPage) canFetchMore = false;
        widget.onListItemsChange(listItems);
      },
    );
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading && page == 1) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: Column(children: [Spacer(), LoadingSpinner(), Spacer()]),
      );
    }
    final bool isFetchingData = isLoading && page != 1;
    return SliverPadding(
      padding: widget.padding,
      sliver: SliverGrid.builder(
        key: UniqueKey(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.crossAxisCount,
          childAspectRatio: widget.childAspectRatio,
          crossAxisSpacing: AppSize.s8,
          mainAxisSpacing: AppSize.s8,
        ),
        itemCount: isFetchingData ? listItems.length + 1 : listItems.length,
        itemBuilder: (context, index) =>
            isFetchingData && index == listItems.length ? const LoadingSpinner() : widget.child(index),
      ),
    );
  }
}
