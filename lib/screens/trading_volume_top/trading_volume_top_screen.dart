import 'package:flutter/material.dart';
import '../../api/investment_api.dart';
import '../../components/loading_api_error.dart';
import '../trading_voulme_top_detail/trading_volume_top_detail_screen.dart';
import 'components/trading_volume_stock_item.dart';

// 주식 거래량 화면
class TradingVolumeScreen extends StatelessWidget {
  final InvestmentAPI api = InvestmentAPI();

  // 주식 상위 목록 데이터 호출
  Future<List<Map<String, dynamic>>> fetchStockData() {
    return api.getApiT1452("t1452", "0", "1");
  }

  @override
  Widget build(BuildContext context) {
    int displayCount = 5;
    return Scaffold(
      appBar: AppBar(
        title: Text("주식 거래량 상위 목록"),
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
            return
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Column(
                    children: [
                      Expanded(
                        child: TradingVolumeStockItem(
                          stockList: snapshot.data!,
                          displayCount: displayCount,
                        ),
                      ),
                      if (displayCount < snapshot.data!.length) // api 데이터 갯수가 5개보다 많으면
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => TradingVolumeTopDetailScreen()),
                              );
                            },
                            child: Text("더 보 기"),
                          ),
                        ),
                    ],
                  );
                },
              );
          }
        },
      )

    );
  }
}



// ElevatedButton(
//   onPressed: () {
//     setState(() {
//       displayCount = snapshot.data!.length;
//     });
//   },
//   child: Text("더보기"),
// ),