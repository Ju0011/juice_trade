
import 'package:flutter/material.dart';
import '../../api/investment_api.dart';
import '../../components/loading_api_error.dart';
import '../trading_volume_top/components/trading_volume_stock_item.dart';
import '../trading_voulme_top_detail/trading_volume_top_detail_screen.dart';

class TradingVolumeListTest extends StatelessWidget {
  final InvestmentAPI api = InvestmentAPI();

  Future<List<Map<String, dynamic>>> fetchStockData() {
    return api.getApiT1452("t1452", "0", "1");
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
                    children: displayedStocks.map((item) => TradingVolumeStockItem(item: item)).toList(),
                  ),
                  const SizedBox(height: 8.0),
                  if (displayCount < snapshot.data!.length)
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => TradingVolumeTopDetailScreen()),
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
