import 'package:flutter/material.dart';
import '../../api/investment_api.dart';
import '../../components/loading_api_error.dart';
import 'components/sigachong_aeg_stock_item.dart';

class SigachongAegScreen extends StatelessWidget {
  final InvestmentAPI api = InvestmentAPI(); // InvestmentAPI 인스턴스 생성

  // 시가총액 데이터 호출
  Future<List<Map<String, dynamic>>> fetchStockData() {
    return api.getStartCost("001");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("시가 총액 상위"),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchStockData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done ||
              snapshot.hasError ||
              !snapshot.hasData ||
              snapshot.data!.isEmpty) {
            return LoadingApiError(snapshot: snapshot);
          } else {
            final stockList = snapshot.data!;
            return ListView.builder(
              padding: EdgeInsets.all(5),  //padding
              itemCount: stockList.length,
              itemBuilder: (context, index) {
                final item = stockList[index];
                return SigachongAegStockItem(item: item);
              },
            );
          }
        },
      ),
    );
  }
}
