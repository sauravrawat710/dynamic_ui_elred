import '../../models/gamification_model.dart';
import 'custom_textfield.dart';
import '../../provider/gamification_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'custom_radio_button.dart';

class GenerateCustomField extends StatelessWidget {
  const GenerateCustomField({super.key, required this.screen});

  final Screen screen;

  @override
  Widget build(BuildContext context) {
    final provider = context.read<GamificationProvider>();
    if (screen.fields.contains('textfield')) {
      return BuildCustomTextField(
        label: screen.hintText ?? 'N/A',
        onChanged: (value) {
          if (screen.screenName == 'name') {
            provider.onNameChanged(value);
          } else {
            provider.onDevelopChanged(value);
          }
        },
      );
    } else if (screen.fields.contains('radio')) {
      if (screen.screenName != 'gender') {
        return Column(
            children: screen.options!
                .map((option) => BuildCustomRadioButton(
                      isSelected: _isSelected(screen, context, option),
                      title: option.text,
                      value: option.value,
                      groupValue: _findGroupValue(screen, provider),
                      onChanged: (value) =>
                          _onChangeForRadio(screen, provider, value),
                    ))
                .toList());
      } else {
        return Row(
            children: screen.options!
                .map((e) => Expanded(
                      child: BuildCustomRadioButton(
                        isSelected: _isSelected(screen, context, e),
                        title: e.text,
                        value: e.value,
                        groupValue: _findGroupValue(screen, provider),
                        onChanged: (value) =>
                            _onChangeForRadio(screen, provider, value),
                      ),
                    ))
                .toList());
      }
    } else if (screen.fields.contains('datefield')) {
      return GestureDetector(
        onTap: () async {
          final pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime(2000),
            firstDate: DateTime(1800),
            lastDate: DateTime.now(),
          );

          if (pickedDate != null) {
            provider.onDobChanged(pickedDate);
          }
        },
        child: SizedBox(
          height: 48,
          child: Stack(
            children: [
              Container(
                height: 48,
                margin: const EdgeInsets.only(right: 15),
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
              Positioned(
                left: 15,
                top: 12,
                child: Text(
                  context.watch<GamificationProvider>().dob != null
                      ? DateFormat('dd/MM/yyyy')
                          .format(context.watch<GamificationProvider>().dob!)
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
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

void _onChangeForRadio(
    Screen screen, GamificationProvider provider, String? value) {
  if (screen.screenName == 'gender') {
    provider.onGenderChange(value as String);
  } else if (screen.screenName == 'profession') {
    provider.onProfessionChanged(value as String);
  } else {
    provider.onDevelopChanged(value as String);
  }
}

String _findGroupValue(Screen screen, GamificationProvider provider) {
  switch (screen.screenName) {
    case 'gender':
      return provider.gender;
    case 'profession':
      return provider.profession;
    default:
      return provider.develop;
  }
}

bool _isSelected(Screen screen, BuildContext context, Option e) {
  switch (screen.screenName) {
    case 'gender':
      return context.watch<GamificationProvider>().gender == e.value;
    case 'profession':
      return context.watch<GamificationProvider>().profession == e.value;
    case 'technology':
      return context.watch<GamificationProvider>().develop == e.value;
    default:
      return false;
  }
}
