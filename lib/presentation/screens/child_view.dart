import '../../helpers/test_style.dart';
import '../../models/gamification_model.dart';
import 'summary_screen.dart';
import '../widgets/build_top_text_heading.dart';
import '../widgets/custom_button.dart';
import '../widgets/generate_custom_field_widget.dart';
import '../../provider/gamification_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChildView extends StatelessWidget {
  const ChildView({super.key, required this.screen});

  final Screen screen;

  @override
  Widget build(BuildContext context) {
    return Consumer<GamificationProvider>(builder: (context, provider, child) {
      return provider.showSummary
          ? const SummaryScreen()
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                (provider.name != '' && screen.screenName != 'name')
                    ? BuildTopTextHeading(screen: screen)
                    : const SizedBox.shrink(),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      Text(screen.question,
                          style: textstyle.copyWith(
                              fontSize: 28, color: const Color(0xFFFBAA29))),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: GenerateCustomField(screen: screen),
                ),
                const Spacer(),
                BuildCustomButton(
                  isDisabled:
                      context.watch<GamificationProvider>().name.isEmpty,
                  label: 'Next',
                  onPressed: () {
                    if (provider.currentScreen.screenName == 'technology') {}
                    provider.incrementIndex();
                  },
                ),
              ],
            );
    });
  }
}
