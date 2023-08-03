import 'package:provider/provider.dart';

import '../../helpers/test_style.dart';
import '../../models/gamification_model.dart';
import '../../provider/gamification_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BuildTopTextHeading extends StatelessWidget {
  const BuildTopTextHeading({super.key, required this.screen});
  final Screen screen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Row(
        children: [
          Consumer<GamificationProvider>(
            builder: (context, provider, child) => Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'My name is ',
                    style: textstyle2.copyWith(color: Colors.black),
                  ),
                  TextSpan(
                    text: provider.name,
                    style: textstyle2.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  if (provider.gender != '' &&
                      screen.screenName != 'gender') ...[
                    TextSpan(
                      text: ' I am a ',
                      style: textstyle2.copyWith(color: Colors.black),
                    ),
                    TextSpan(
                      text: provider.gender,
                      style: textstyle2.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    if (provider.dob != null && screen.screenName != 'dob') ...[
                      TextSpan(
                        text: ' \nborn on ',
                        style: textstyle2.copyWith(color: Colors.black),
                      ),
                      TextSpan(
                        text: provider.dob != null
                            ? DateFormat('dd MMMM yyyy').format(provider.dob!)
                            : 'N/A',
                        style: textstyle2.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
