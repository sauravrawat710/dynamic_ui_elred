import 'package:dynamic_elred/presentation/widgets/custom_button.dart';
import 'package:dynamic_elred/provider/gamification_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UXScreen extends StatelessWidget {
  const UXScreen({super.key});

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
                    text: 'I am a ',
                    style: TextStyle(
                      color: Color(0xFF060606),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: context.read<GamificationProvider>().profession,
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
            'and i have a knowledge \nof',
            style: TextStyle(
              color: Color(0xFFFBAA29),
              fontSize: 28,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              SizedBox(
                width: 150,
                child: RadioListTile(
                  contentPadding: EdgeInsets.zero,
                  selected:
                      context.watch<GamificationProvider>().uiux == 'figma',
                  activeColor: const Color(0xFFFBAA29),
                  selectedTileColor: const Color(0xFFFBAA29),
                  title: const Text('Figma'),
                  value: 'figma',
                  groupValue: 'ui/ux',
                  onChanged: (value) {
                    context
                        .read<GamificationProvider>()
                        .onUIUXChanged(value as String);
                  },
                ),
              ),
              SizedBox(
                width: 160,
                child: RadioListTile(
                  contentPadding: EdgeInsets.zero,
                  selected:
                      context.watch<GamificationProvider>().uiux == 'adobeXD',
                  activeColor: const Color(0xFFFBAA29),
                  selectedTileColor: const Color(0xFFFBAA29),
                  title: const Text('AdobeXD'),
                  value: 'adobeXD',
                  groupValue: 'ui/ux',
                  onChanged: (value) {
                    context
                        .read<GamificationProvider>()
                        .onUIUXChanged(value as String);
                  },
                ),
              ),
            ],
          ),
          const Spacer(),
          BuildCustomButton(
            isDisabled: context.watch<GamificationProvider>().uiux.isEmpty,
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
