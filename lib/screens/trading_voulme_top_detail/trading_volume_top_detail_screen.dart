import 'package:flutter/material.dart';

import '../../api/investment_api.dart';
import '../../components/loading_api_error.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../trading_volume_top/components/trading_volume_stock_item.dart';
import 'components/day_toggle.dart';
import 'components/kospi_toggle.dart';

//주식 거래량 화면

class TradingVolumeTopDetailScreen extends StatelessWidget {
  final InvestmentAPI api = InvestmentAPI();

  final ValueNotifier<int> gubunNotifier = ValueNotifier<int>(0); // 0: 전체, 1: 코스피, 2: 코스닥
  final ValueNotifier<int> jnilgubunNotifier = ValueNotifier<int>(1); // 1: 당일, 2: 전일

  Future<List<Map<String, dynamic>>> fetchStockData(int gubun, int jnilgubun) {
    String s_gubun;
    String s_jnilgubun;

    switch (gubun) {
      case 1:
        s_gubun = "1"; // 코스피
      case 2:
        s_gubun = "2"; // 코스닥
        break;
      default:
        s_gubun = "0"; // 전체
    }

    s_jnilgubun = jnilgubun.toString();

    return api.getApiT1452("t1452", s_gubun, s_jnilgubun);   // tr_cd, gubun - 0:전체 1:코스피 2:코스닥, jnilgubun - 1:당일 2:전일
  }

  @override
  Widget build(BuildContext context) {
    int gubun = 0;
    int jnilgubun = 1;

    return Scaffold(
      appBar: AppBar(
        title: Text("주식 거래량 상위 목록"),
      ),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [

                // KospiToggle을 전체 너비의 2/3 정도 차지하도록 조정
                Flexible(
                  flex: 2,
                  child: KospiToggle(
                    initialIndex: gubunNotifier.value,
                    onToggle: (index) {
                      gubunNotifier.value = index;
                    },
                  ),
                ),

                SizedBox(width: 8), // 두 토글 간의 간격


                Flexible(
                  flex: 1,
                  child: DayToggle(
                    initialIndex: jnilgubunNotifier.value - 1, // 0: 당일, 1: 전일
                    onToggle: (index) {
                      jnilgubunNotifier.value = index;
                    },
                  ),
                ),
              ],
            ),
          ),



          Expanded(
            child: ValueListenableBuilder<int>(
              valueListenable: gubunNotifier,
              builder: (context, gubun, _) {
                return ValueListenableBuilder<int>(
                  valueListenable: jnilgubunNotifier,
                  builder: (context, jnilgubun, _) {
                    return FutureBuilder<List<Map<String, dynamic>>>(
                      future: fetchStockData(gubun, jnilgubun),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done ||
                            snapshot.hasError ||
                            !snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return LoadingApiError(snapshot: snapshot);
                        } else {
                          // 성공일 경우 데이터 리스트 출력
                          return TradingVolumeStockItem(
                            stockList: snapshot.data!,
                            displayCount: snapshot.data!.length,
                          );
                        }
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}