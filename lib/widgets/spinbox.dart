import "dart:math";

import "package:flutter/material.dart";
import "package:flutter/services.dart";

class SpinBox extends StatelessWidget {
  const SpinBox({super.key, required this.value, required this.onChange});

  final int value;
  final void Function(int value) onChange;

  // max uint32 value
  static final maxValue = pow(2, 32).toInt() - 1;
  int clamp(int i) => i.clamp(0, maxValue);

  void onNumberChange(int v) => onChange(clamp(v));

  void onTextChange(String t) {
    if (t.isEmpty) {
      onChange(0);
      return;
    }

    onChange(clamp(int.parse(t)));
  }

  @override
  Widget build(BuildContext context) {
    final cursorPosition = value.toString().length;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          tooltip: "Decrease",
          onPressed: () => onNumberChange(value - 1),
          icon: const Icon(Icons.remove),
        ),
        SizedBox(
          width: 100,
          child: TextField(
            enableInteractiveSelection: false,
            textAlign: TextAlign.center,
            controller: TextEditingController.fromValue(
              TextEditingValue(
                text: value.toString(),
                selection: TextSelection(
                  baseOffset: cursorPosition,
                  extentOffset: cursorPosition,
                ),
              ),
            ),
            onChanged: onTextChange,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ], // Only numbers can be entered
          ),
        ),
        IconButton(
          tooltip: "Increase",
          onPressed: () => onNumberChange(value + 1),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
