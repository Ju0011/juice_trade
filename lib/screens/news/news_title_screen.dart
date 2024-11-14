import 'package:flutter/material.dart';
import '../../api/investment_api.dart';
import '../../components/loading_api_error.dart';
import 'components/news_item.dart';

class NewsTitleScreen extends StatelessWidget {
  final InvestmentAPI api = InvestmentAPI(); // InvestmentAPI 인스턴스 생성

  // 주식 상위 목록 데이터 호출
  Future<List<Map<String, dynamic>>> fetchStockData() {
    return api.getNewsTitle("t3102", "2023051510383935PL7HQ87D");
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
                return NewsItem(item: item);
              },
            );
          }
        },
      ),
    );
  }
}
