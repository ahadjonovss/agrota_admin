part of 'orders_cubit.dart';

class OrderState extends Equatable {
  final List<OrderModel> orders;
  final ResponseStatus status;
  final String message;

  const OrderState(
      {this.orders = const [],
      this.status = ResponseStatus.loading,
      this.message = ''});

  @override
  List<Object> get props => [orders, status, message];

  OrderState copyWith({
    List<OrderModel>? orders,
    ResponseStatus? status,
    String? message,
  }) {
    return OrderState(
      orders: orders ?? this.orders,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
