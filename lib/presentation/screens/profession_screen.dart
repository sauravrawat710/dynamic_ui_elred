import 'package:dynamic_elred/presentation/widgets/custom_button.dart';
import 'package:dynamic_elred/provider/gamification_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProfessionScreen extends StatelessWidget {
  const ProfessionScreen({super.key});

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
                  const TextSpan(
                    text: ' I am a ',
                    style: TextStyle(
                      color: Color(0xFF060606),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: context.read<GamificationProvider>().gender,
                    style: const TextStyle(
                      color: Color(0xFF060606),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const TextSpan(
                    text: ' \nborn on ',
                    style: TextStyle(
                      color: Color(0xFF060606),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: DateFormat('dd/MM/yyyy')
                        .format(context.read<GamificationProvider>().dob!),
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
            'I am a',
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
            selected: context.watch<GamificationProvider>().profession ==
                'frontend developer',
            activeColor: const Color(0xFFFBAA29),
            selectedTileColor: const Color(0xFFFBAA29),
            title: const Text('a frontend developer'),
            value: 'frontend developer',
            groupValue: 'profession',
            onChanged: (value) {
              context
                  .read<GamificationProvider>()
                  .onProfessionChanged(value as String);
            },
          ),
          RadioListTile(
            contentPadding: EdgeInsets.zero,
            selectedTileColor: const Color(0xFFFBAA29),
            selected: context.watch<GamificationProvider>().profession ==
                'backend developer',
            title: const Text('a backend developer'),
            activeColor: const Color(0xFFFBAA29),
            value: 'backend developer',
            groupValue: 'profession',
            onChanged: (value) {
              context
                  .read<GamificationProvider>()
                  .onProfessionChanged(value as String);
            },
          ),
          RadioListTile(
            contentPadding: EdgeInsets.zero,
            activeColor: const Color(0xFFFBAA29),
            selectedTileColor: const Color(0xFFFBAA29),
            selected: context.watch<GamificationProvider>().profession ==
                'UI/UX designer',
            title: const Text('a UI/UX designer'),
            value: 'UI/UX designer',
            groupValue: 'profession',
            onChanged: (value) {
              context
                  .read<GamificationProvider>()
                  .onProfessionChanged(value as String);
            },
          ),
          const Spacer(),
          BuildCustomButton(
            isDisabled: context.read<GamificationProvider>().profession.isEmpty,
            label: 'Next',
            onPressed: () {
              final profession =
                  context.read<GamificationProvider>().profession;

              if (profession == 'frontend developer') {
                context.read<GamificationProvider>().changeIndex(4);
              } else if (profession == 'backend developer') {
                context.read<GamificationProvider>().changeIndex(5);
              } else if (profession == 'UI/UX designer') {
                context.read<GamificationProvider>().changeIndex(6);
              }
            },
          ),
        ],
      ),
    );
  }
}
