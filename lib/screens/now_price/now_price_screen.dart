import 'package:flutter/material.dart';
import '../../api/investment_api.dart';
import '../../components/constants.dart';
import '../../components/loading_api_error.dart';
import '../../theme.dart';

class NowPriceScreen extends StatelessWidget {
  final InvestmentAPI api = InvestmentAPI();
  final String shcode;

  NowPriceScreen({Key? key, required this.shcode}) : super(key: key);

  // 시가총액 데이터 호출 함수
  Future<List<Map<String, dynamic>>> fetchStockData() {
    return api.getNowCost(shcode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchStockData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done ||
              snapshot.hasError ||
              !snapshot.hasData ||
              snapshot.data!.isEmpty) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Loading...'),
              ),
              body: LoadingApiError(snapshot: snapshot),
            );
          } else {
            final stockList = snapshot.data!;
            final hname = stockList.isNotEmpty ? stockList[0]['hname'] : 'No Name';
            final nowCost = stockList.isNotEmpty ? stockList[0]['price'] : 'No Name';
            final change = stockList[0]['change'];


            return Scaffold(
              backgroundColor: const Color(0xffD3D3D3),
              appBar: AppBar(
                title: Text(hname),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    margin: const EdgeInsets.all(10.0), // 화면 여백
                    decoration: nowCostContainer,

                    child: Column(
                      children: [
                        Align(
                          alignment: const Alignment(-0.8, 0.5),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(numberFormat.format(nowCost), style: percentageTextStyle(change.toDouble(), 0, 30.0)),
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  ),

                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Align(
                          alignment: const Alignment(-0.8, 0.5),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(numberFormat.format(nowCost), style: percentageTextStyle(change.toDouble(), 0, 30.0)),
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                      ],
                    ),

                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
