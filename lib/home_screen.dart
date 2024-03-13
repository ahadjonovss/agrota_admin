import 'package:agrota_admin/cubits/orders/orders_cubit.dart';
import 'package:agrota_admin/models/order_model.dart';
import 'package:agrota_admin/widgets/order_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Filter _activeFilter = Filter.All;

  @override
  void initState() {
    context.read<OrdersCubit>().fetchNews();
    super.initState();
  }

  List<OrderModel> orders = [];

  void onTap(int index, List<OrderModel> allOrders) {
    if (index == 0) {
      orders = allOrders;
    } else {
      orders = allOrders
          .where((element) => element.paymentType.id == index)
          .toList();
      orders.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agrota Market - Заказы',
          style: TextStyle(color: Color(0xFF061E42)),
        ),
        elevation: 1,
        backgroundColor: const Color(0xFFF5F5F5),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<OrdersCubit, OrderState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      FilterButton(
                        filter: Filter.All,
                        isActive: _activeFilter == Filter.All,
                        onPressed: () {
                          setState(() {
                            onTap(0, state.orders);
                            _activeFilter = Filter.All;
                          });
                        },
                      ),
                      const SizedBox(width: 10),
                      FilterButton(
                        filter: Filter.FormCash,
                        isActive: _activeFilter == Filter.FormCash,
                        onPressed: () {
                          onTap(2, state.orders);

                          setState(() {
                            _activeFilter = Filter.FormCash;
                          });
                        },
                      ),
                      const SizedBox(width: 10),
                      FilterButton(
                        filter: Filter.FormCompany,
                        isActive: _activeFilter == Filter.FormCompany,
                        onPressed: () {
                          onTap(3, state.orders);

                          setState(() {
                            _activeFilter = Filter.FormCompany;
                          });
                        },
                      ),
                      const SizedBox(width: 10),
                      FilterButton(
                        filter: Filter.FormPayme,
                        isActive: _activeFilter == Filter.FormPayme,
                        onPressed: () {
                          onTap(1, state.orders);

                          setState(() {
                            _activeFilter = Filter.FormPayme;
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          BlocBuilder<OrdersCubit, OrderState>(
            builder: (context, state) {
              if (state.status == ResponseStatus.success) {
                return Expanded(
                  child: ListView.builder(
                    itemCount:
                        orders.isEmpty ? state.orders.length : orders.length,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(top: 8.0),
                    itemBuilder: (context, index) => OrderItem(
                        orders.isEmpty ? state.orders[index] : orders[index]),
                  ),
                );
              } else if (state.status == ResponseStatus.loading) {
                return const Center(child: CupertinoActivityIndicator());
              } else {
                return Center(child: Text(state.message));
              }
            },
          ),
        ],
      ),
    );
  }
}

enum Filter { All, FormCash, FormCompany, FormPayme }

class FilterButton extends StatelessWidget {
  final Filter filter;
  final bool isActive;
  final VoidCallback onPressed;

  const FilterButton({
    required this.filter,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    String buttonText;
    switch (filter) {
      case Filter.All:
        buttonText = 'Все';
        break;
      case Filter.FormCash:
        buttonText = 'Наличные';
        break;
      case Filter.FormCompany:
        buttonText = 'Перечисление';
        break;
      case Filter.FormPayme:
        buttonText = 'С картой';
        break;
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          return isActive ? Colors.blue : Colors.grey;
        }),
      ),
      child: Text(buttonText),
    );
  }
}
