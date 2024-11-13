
import 'package:flutter/material.dart';
import '../../api/investment_api.dart';
import '../../components/loading_api_error.dart';
import '../sigachong_aeg/components/sigachong_aeg_stock_item.dart';
import '../sigachong_aeg/sigachong_aeg_screen.dart';
import '../trading_volume_top/components/trading_volume_stock_item.dart';
import '../trading_voulme_top_detail/trading_volume_top_detail_screen.dart';

class TradingVolumeListTest2 extends StatelessWidget {
  final InvestmentAPI api = InvestmentAPI();

  Future<List<Map<String, dynamic>>> fetchStockData() {
    return api.getNowCost("001");
  }

  @override
  Widget build(BuildContext context) {
    int displayCount = 5;

    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchStockData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done ||
            snapshot.hasError ||
            !snapshot.hasData ||
            snapshot.data!.isEmpty) {
          return LoadingApiError(snapshot: snapshot);
        } else {
          final displayedStocks = snapshot.data!.take(displayCount).toList();

          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: displayedStocks.map((item) => SigachongAegStockItem(item: item)).toList(),
                  ),
                  const SizedBox(height: 8.0),
                  if (displayCount < snapshot.data!.length)
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => SigachongAegScreen()),
                        );
                      },
                      child: Text("더 보 기"),
                    ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
