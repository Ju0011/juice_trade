// trading_volume_stock_item.dart
import 'package:flutter/material.dart';

import '../../../components/constants.dart';

class TradingVolumeStockItem extends StatelessWidget {
  final List<Map<String, dynamic>> stockList;
  final int displayCount;

  // 생성자를 통해 데이터와 표시 개수 받기
  const TradingVolumeStockItem({
    Key? key,
    required this.stockList,
    required this.displayCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayedStocks = stockList.take(displayCount).toList();

    return ListView.builder(
      itemCount: displayedStocks.length,
      itemBuilder: (context, index) {
        final item = displayedStocks[index];

        //전일비율
        final double befDiff = double.tryParse(item['bef_diff'].toString()) ?? 0.0;

        return ListTile(
          title: Text(item['hname'] ?? 'No name'), // 주식 이름
          subtitle: Text("가격: ${numberFormat.format(item['price'])}원"), // 주식 가격

          // 전일비율에 따른 색상 설정
          trailing: Text(
            "전일비율: ${befDiff}%",
            style: TextStyle(
              color: befDiff >= 100 ? Colors.red : Colors.blue, // 100% 이상 빨간색, 미만 파란색
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }

}
