import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../core/base/models/pagination_model.dart';
import '../../../core/services/error/failure.dart';
import '../models/responses/order_model.dart';
import '../repos/orders_repo.dart';

class MyOrdersController extends GetxController {
  final OrdersRepo _ordersRepo;

  MyOrdersController(this._ordersRepo);

  RxBool isLoading = false.obs;
  RxList<OrderModel> myOrders = <OrderModel>[].obs;

  Future<Either<Failure, PaginationModel<OrderModel>>> getMyOrders({int page = 1}) async {
    final result = await _ordersRepo.getMyOrders();
    return result;
  }
}
