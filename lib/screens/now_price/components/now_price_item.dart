import 'package:flutter/material.dart';


class PriceInfo extends StatelessWidget {
  final String label;
  final String price;
  final String change;

  PriceInfo({required this.label, required this.price, required this.change});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 4),
        Text(price),
        SizedBox(height: 4),
        Text(change),
      ],
    );
  }
}

class OrderBook extends StatelessWidget {
  final List<String> bidPrices;
  final List<String> askPrices;

  OrderBook({required this.bidPrices, required this.askPrices});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            children: bidPrices.map((price) => Text(price)).toList(),
          ),
        ),
        Expanded(
          child: Column(
            children: askPrices.map((price) => Text(price)).toList(),
          ),
        ),
      ],
    );
  }
}
