import 'package:dynamic_elred/presentation/widgets/custom_button.dart';
import 'package:dynamic_elred/provider/gamification_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DobScreen extends StatefulWidget {
  const DobScreen({super.key});

  @override
  State<DobScreen> createState() => _DobScreenState();
}

class _DobScreenState extends State<DobScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'My name is ',
                    style: TextStyle(
                      color: Color(0xFF060606),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: context.read<GamificationProvider>().name,
                    style: const TextStyle(
                      color: Color(0xFF060606),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Text(
            'born on',
            style: TextStyle(
              color: Color(0xFFFBAA29),
              fontSize: 28,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime(2000),
                firstDate: DateTime(1800),
                lastDate: DateTime.now(),
              );

              if (pickedDate != null) {
                context.read<GamificationProvider>().onDobChanged(pickedDate);
              }
            },
            child: SizedBox(
              height: 48,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 335,
                      height: 48,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF4F6F9),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 0.50,
                            color: Color(0xFFD9D9D9),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    top: 12,
                    child: Text(
                      context.watch<GamificationProvider>().dob != null
                          ? DateFormat('dd/MM/yyyy').format(
                              context.watch<GamificationProvider>().dob!)
                          : 'Select date of birth',
                      style: TextStyle(
                        color: context.watch<GamificationProvider>().dob != null
                            ? null
                            : const Color(0x7F060606),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          BuildCustomButton(
            isDisabled: context.watch<GamificationProvider>().dob == null,
            label: 'Next',
            onPressed: () {
              context.read<GamificationProvider>().incrementIndex();
            },
          ),
        ],
      ),
    );
  }
}
