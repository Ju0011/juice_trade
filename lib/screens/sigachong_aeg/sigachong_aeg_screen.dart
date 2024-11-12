import 'package:flutter/material.dart';
import '../../api/investment_api.dart';
import '../../components/loading_api_error.dart';
import 'components/sigachong_aeg_stock_item.dart';

class SigachongAegScreen extends StatelessWidget {
  final InvestmentAPI api = InvestmentAPI(); // InvestmentAPI 인스턴스 생성

  // 주식 상위 목록 데이터 호출
  Future<List<Map<String, dynamic>>> fetchStockData() {
    return api.getNowCost("001");
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
          } else {  //성공일 경우 listnview 출력
            return SigachongAegStockItem(stockList: snapshot.data!);
          }
        },
      ),
    );
  }
}
