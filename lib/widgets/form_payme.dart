import 'package:flutter/material.dart';

class FormPayme extends StatelessWidget {
  const FormPayme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Номер заказа: " + "61",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFF061E42),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Заказчик: " + "Отабек",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF061E42),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            "Номер телефона: " + "+998981118006",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF061E42),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            "Тип оплаты: " + "С картой",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF061E42),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            "Филиал: " + "Филиал Наманган",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF061E42),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Cтатус заказа: " + "Ожидание оплаты",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF061E42),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            "Время заказа: " + "10.03.2024  17:25",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF061E42),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Сумма заказа:",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF061E42),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "105 000 000" + " сум",
            style: TextStyle(
              fontSize: 35,
              color: Color(0xFF061E42),
            ),
          ),
        ],
      ),
    );
  }
}
