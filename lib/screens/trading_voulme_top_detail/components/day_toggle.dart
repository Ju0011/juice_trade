import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class DayToggle extends StatelessWidget {
  final int initialIndex;
  final ValueChanged<int> onToggle;

  const DayToggle({
    Key? key,
    required this.initialIndex,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ToggleSwitch(
        activeBgColor: const [Colors.green],
        activeFgColor: Colors.white,

        initialLabelIndex: initialIndex,
        totalSwitches: 2,
        labels: ['당일', '전일'],
        onToggle: (index) {
          if (index != null) {
            onToggle(index + 1); // 1 또는 2 값을 부모에 전달
          }
        },
      ),
    );
  }
}
