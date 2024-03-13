import 'package:agrota_admin/models/order_model.dart';
import 'package:agrota_admin/service/dio_settings.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'orders_state.dart';

enum ResponseStatus { initial, loading, success, error }

class OrdersCubit extends Cubit<OrderState> {
  OrdersCubit() : super(const OrderState());
  final Dio _dio = DioSettings().dio;

  Future<void> fetchNews() async {
    emit(state.copyWith(status: ResponseStatus.loading));
    try {
      final response = await _dio.get('order');
      print("Mana status ${response.statusCode}");
      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        final orders = List<OrderModel>.from(
            responseData.map((i) => OrderModel.fromJson(i)));
        emit(state.copyWith(status: ResponseStatus.success, orders: orders));
      } else {
        emit(state.copyWith(
            status: ResponseStatus.error, message: "Failed to fetch data"));
      }
    } catch (e) {
      emit(state.copyWith(status: ResponseStatus.error, message: e.toString()));
    }
  }
}
