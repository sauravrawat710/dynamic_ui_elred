import 'package:flutter/material.dart';

class BuildCustomRadioButton extends StatelessWidget {
  const BuildCustomRadioButton({
    super.key,
    required this.isSelected,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final bool isSelected;
  final String title;
  final String value;
  final String groupValue;
  final void Function(String? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Row(
        children: [
          Radio<String>(
            value: value,
            groupValue: groupValue,
            onChanged: (value) {
              if (value != groupValue) {
                onChanged(value);
              }
            },
            activeColor: const Color(0xFFFBAA29),
          ),
          Text(
            title,
            style:
                TextStyle(color: isSelected ? const Color(0xFFFBAA29) : null),
          ),
        ],
      ),
    );
  }
}
