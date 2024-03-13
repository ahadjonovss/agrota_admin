import 'package:agrota_admin/models/order_model.dart';
import 'package:agrota_admin/utils/assistants.dart';
import 'package:flutter/material.dart';

class FormPayme extends StatelessWidget {
  OrderModel order;
  FormPayme(
    this.order, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: statusColors[order.status],
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Номер заказа: " + "${order.id}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFF061E42),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Заказчик: ${order.user.firstname}",
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF061E42),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            "Номер телефона: ${order.user.login}",
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF061E42),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          const Text(
            "Тип оплаты: " + "С картой",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF061E42),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            "Филиал: " + "${order.branch.name['ru']}",
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF061E42),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Cтатус заказа: ${getStatusTranslation(order.status)}",
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF061E42),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            "Время заказа: ${formatDateTime(order.createdAt)}",
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF061E42),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Сумма заказа:",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF061E42),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${formatPrice(int.parse(order.totalPrice))} сум",
            style: const TextStyle(
              fontSize: 35,
              color: Color(0xFF061E42),
            ),
          ),
        ],
      ),
    );
  }
}
