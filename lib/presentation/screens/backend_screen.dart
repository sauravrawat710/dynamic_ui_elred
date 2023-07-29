import 'package:dynamic_elred/presentation/screens/summary_screen.dart';
import 'package:dynamic_elred/presentation/widgets/custom_button.dart';
import 'package:dynamic_elred/presentation/widgets/custom_textfield.dart';
import 'package:dynamic_elred/provider/gamification_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BackendScreen extends StatelessWidget {
  const BackendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'I am ',
                    style: TextStyle(
                      color: Color(0xFF060606),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: 'a backend developer',
                    style: TextStyle(
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
            'and I have knowledge \nof',
            style: TextStyle(
              color: Color(0xFFFBAA29),
              fontSize: 28,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          // const SizedBox(height: 30),
          BuildCustomTextField(
            initialValue:
                context.watch<GamificationProvider>().backendTechStack,
            label: 'Enter technology name',
            onChanged: (value) {
              context
                  .read<GamificationProvider>()
                  .onBackendTechStackChanged(value);
            },
          ),
          const Spacer(),
          BuildCustomButton(
            isDisabled:
                context.watch<GamificationProvider>().backendTechStack.isEmpty,
            label: 'Next',
            onPressed: () {
              final provider = context.read<GamificationProvider>();
              context.read<GamificationProvider>().changeIndex(provider.screens
                  .indexWhere((element) => element is SummaryScreen));
            },
          ),
        ],
      ),
    );
  }
}
