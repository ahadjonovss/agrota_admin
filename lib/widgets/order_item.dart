import 'package:agrota_admin/models/order_model.dart';
import 'package:agrota_admin/widgets/form_cash.dart';
import 'package:agrota_admin/widgets/form_company.dart';
import 'package:agrota_admin/widgets/form_payme.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  OrderModel order;
  OrderItem(this.order, {super.key});

  @override
  Widget build(BuildContext context) {
    switch (order.paymentType.id) {
      case 2:
        return FormCash(order);
      case 3:
        return FormCompany(order);
      default:
        return FormPayme(order);
    }
  }
}
