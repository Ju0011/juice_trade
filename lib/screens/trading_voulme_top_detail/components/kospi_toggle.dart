import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class KospiToggle extends StatelessWidget {
  final int initialIndex;
  final ValueChanged<int> onToggle;

  const KospiToggle({
    Key? key,
    required this.initialIndex,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ToggleSwitch(
        initialLabelIndex: initialIndex,
        totalSwitches: 3,
        labels: ['전체', '코스닥', '코스피'],
        onToggle: (index) {
          if (index != null) {
            onToggle(index); // 부모로 선택된 인덱스를 전달
          }
        },
      ),
    );
  }
}
