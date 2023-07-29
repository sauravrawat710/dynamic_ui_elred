import 'package:dynamic_elred/presentation/screens/summary_screen.dart';
import 'package:dynamic_elred/presentation/widgets/custom_button.dart';
import 'package:dynamic_elred/provider/gamification_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FrontendScreen extends StatelessWidget {
  const FrontendScreen({super.key});

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
                    text: 'I am a ',
                    style: TextStyle(
                      color: Color(0xFF060606),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: 'frontend Developer',
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
            'and I develop',
            style: TextStyle(
              color: Color(0xFFFBAA29),
              fontSize: 28,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 15),
          RadioListTile(
            contentPadding: EdgeInsets.zero,
            selected: context.watch<GamificationProvider>().develop ==
                'web Application',
            activeColor: const Color(0xFFFBAA29),
            selectedTileColor: const Color(0xFFFBAA29),
            title: const Text('Web Application'),
            value: 'web Application',
            groupValue: 'profession',
            onChanged: (value) {
              context
                  .read<GamificationProvider>()
                  .onDevelopChanged(value as String);
            },
          ),
          RadioListTile(
            contentPadding: EdgeInsets.zero,
            selectedTileColor: const Color(0xFFFBAA29),
            selected: context.watch<GamificationProvider>().develop ==
                'mobile Application',
            activeColor: const Color(0xFFFBAA29),
            title: const Text('Mobile Application'),
            value: 'mobile Application',
            groupValue: 'profession',
            onChanged: (value) {
              context
                  .read<GamificationProvider>()
                  .onDevelopChanged(value as String);
            },
          ),
          const Spacer(),
          BuildCustomButton(
            isDisabled: context.watch<GamificationProvider>().develop.isEmpty,
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
