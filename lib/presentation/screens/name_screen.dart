import 'package:dynamic_elred/presentation/widgets/custom_button.dart';
import 'package:dynamic_elred/presentation/widgets/custom_textfield.dart';
import 'package:dynamic_elred/provider/gamification_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'My name is',
                style: TextStyle(
                  color: Color(0xFFFBAA29),
                  fontSize: 28,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        BuildCustomTextField(
          initialValue: context.watch<GamificationProvider>().name,
          label: 'Enter your name',
          onChanged: (value) {
            context.read<GamificationProvider>().onNameChanged(value);
          },
        ),
        const Spacer(),
        BuildCustomButton(
            isDisabled: context.watch<GamificationProvider>().name.isEmpty,
            label: 'Next',
            onPressed: () {
              context.read<GamificationProvider>().incrementIndex();
            }),
      ],
    );
  }
}
