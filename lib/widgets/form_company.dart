import 'package:flutter/material.dart';

class FormCompany extends StatelessWidget {
  const FormCompany({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.redAccent,
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
            "Тип оплаты: " + "Перечисление",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF061E42),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            "Филиал: " + "Головной офис",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF061E42),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Компания: " + "Energy Agro",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF061E42),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            "ИНН: " + "1450863",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF061E42),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            "Телефон: " + "+998909716872",
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
            "500 000" + " сум",
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
