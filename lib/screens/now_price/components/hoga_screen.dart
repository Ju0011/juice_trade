import 'package:flutter/material.dart';

import '../../../components/constants.dart';
import '../../../theme.dart';

class CurrentPriceContainer extends StatelessWidget {
  final String hname;
  final int nowCost;
  final double change;
  final int volume;
  final String diff;
  final String shcode;

  const CurrentPriceContainer({
    Key? key,
    required this.hname,
    required this.nowCost,
    required this.change,
    required this.volume,
    required this.diff,
    required this.shcode,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Align(
            alignment: const Alignment(-0.8, 0.5),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(shcode,
                style: hogaContainerText(),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-0.8, 0.5),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                numberFormat.format(nowCost),
                style: percentageTextStyle(change, 0, 30.0),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-0.8, 1.0),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                numberFormat.format(change),
                style: percentageTextStyle(change, 0, 15.0),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-0.8, 1.0),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                numberFormat.format(volume),
                style: hogaContainerText(),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.5, -0.5),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text("$diff%",
                style: percentageTextStyle(change, 0, 15.0),
              ),
            ),
          ),
        ],
    );
  }
}
