
import 'package:flutter/material.dart';
import '../../../components/constants.dart';
import '../../../theme.dart';

// 주식 항목 하나를 표시하는 위젯
class TradingVolumeStockItem extends StatelessWidget {
  final Map<String, dynamic> item;

  const TradingVolumeStockItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double befDiff = double.tryParse(item['bef_diff'].toString()) ?? 0.0;

    return ListTile(
      horizontalTitleGap: 10,
      leading: stockAvatar(item['hname']), // theme.dart의 getStockAvatar 함수 사용
      title: Text(item['hname'] ?? 'No name'),
      //subtitle: Text("${numberFormat.format(item['price'])}원"),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "${numberFormat.format(item['price'])}원",
            style: percentageTextStyle(befDiff, 100, 16.0),
            //fontSize : 16.0,
          ),
          Text(
            "${befDiff.toStringAsFixed(2)}%",
            style: percentageTextStyle(befDiff, 100, 8.0),
          ),
        ],
      ),
    );
  }
}
