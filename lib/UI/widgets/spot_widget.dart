
import 'package:dummy_trading/utils/style.dart';
import 'package:flutter/material.dart';

class SpotWidget extends StatelessWidget {
  bool isGain;
  String gainLoss;
  SpotWidget({super.key, required this.gainLoss, required this.isGain});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      decoration: cardStyle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isGain ? Colors.blue.shade400 : Colors.red.shade500 
            ),
            child: Center(
              child: Padding(padding: EdgeInsets.all(8), child: Icon(isGain ? Icons.arrow_drop_up : Icons.arrow_drop_down, size: 30, color: Colors.white,),),
            ),
          ),
          const SizedBox(width: 12,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("\$ $gainLoss", style: largeBold.copyWith(fontWeight: FontWeight.w900),),
              Text(isGain? "Todays Gains" : "Overall Loss", style: smallSemiBold.copyWith(color: Colors.grey),)
            ],
          )
        ],
      ),
    );
  }
}