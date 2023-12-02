import 'package:flutter/material.dart';
import 'package:webclient/style.dart';

class Menu extends StatelessWidget {
  final String name, description;
  final int price;

  const Menu({
    super.key,
    required this.name,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 150.0,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.text),
        color: AppColor.background,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            offset: const Offset(3, 3),
            color: Colors.black.withOpacity(0.3),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/coffee.png'),
            width: 40,
            height: 40,
          ),
          NormalText(content: name),
          BoldText(content: '$price point'),
        ],
      ),
    );
  }
}
