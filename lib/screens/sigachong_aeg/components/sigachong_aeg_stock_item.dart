import 'package:flutter/material.dart';
import 'package:juice_trade/components/constants.dart';

class SigachongAegStockItem extends StatelessWidget {
  final List<Map<String, dynamic>> stockList;

  // 생성자를 통해 데이터 받기
  const SigachongAegStockItem({Key? key, required this.stockList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: stockList.length,
      itemBuilder: (context, index) {
        final item = stockList[index];

        //전일비율
        final double Diff = double.tryParse(item['diff'].toString()) ?? 0.0;

        return ListTile(
          title: Text(item['hname'] ?? 'No name'), // 주식 이름
          subtitle: Text("가격: ${numberFormat.format(item['price'])}원"), // 주식 가격

          trailing: Text(
            "변동률: ${Diff}%",
            style: TextStyle(
              color: Diff < 0 ? Colors.red : Colors.blue, // 100% 이상 빨간색, 미만 파란색
              fontWeight: FontWeight.bold,
            ),
          ),

          //trailing: Text("변동: ${item['diff']}%"), // 변동률
        );
      },
    );
  }
}
