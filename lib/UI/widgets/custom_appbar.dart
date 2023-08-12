
import 'package:dummy_trading/utils/style.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  VoidCallback? onBackPressed;
  Widget? endWidget;
  CustomAppBar(
      {super.key, required this.title, this.onBackPressed, this.endWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(onTap: onBackPressed, child: const Icon(Icons.arrow_back)),
          Text(title, style: largeBold.copyWith(fontWeight: FontWeight.w900),),
          endWidget ?? const SizedBox(width: 18,)
        ],
      ),
    );
  }
}