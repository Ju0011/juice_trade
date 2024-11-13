import 'package:flutter/material.dart';
import 'package:juice_trade/components/constants.dart';

import '../../../theme.dart';

class SigachongAegStockItem extends StatelessWidget {
  final Map<String, dynamic> item;

  const SigachongAegStockItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double Diff = double.tryParse(item['diff'].toString()) ?? 0.0;

    return ListTile(
      horizontalTitleGap: 10,
      leading: stockAvatar(item['hname']), // theme.dart의 getStockAvatar 함수 사용
      title: Text(item['hname'] ?? 'No name'),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "${numberFormat.format(item['price'])}원",
            style: percentageTextStyle(Diff, 0, 16.0),
            //fontSize : 16.0,
          ),
          Text(
            "${Diff.toStringAsFixed(2)}%",
            style: percentageTextStyle(Diff, 0, 8.0),
          ),
        ],
      ),
    );
  }
}
