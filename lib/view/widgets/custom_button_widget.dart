import 'package:flutter/material.dart';

class BuildCustomButton extends StatelessWidget {
  const BuildCustomButton(
      {super.key,
      this.isDisabled = false,
      required this.label,
      required this.onPressed});

  final bool isDisabled;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Container(
          width: 335,
          height: 47,
          decoration: ShapeDecoration(
            color: isDisabled
                ? const Color(0xFFFBAA29).withOpacity(.3)
                : const Color(0xFFFBAA29),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color:
                    isDisabled ? Colors.grey.shade500 : const Color(0xFF060606),
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                letterSpacing: -0.40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
