import '../../helpers/test_style.dart';
import '../widgets/custom_button_widget.dart';
import '../../viewModel/gamification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Consumer<GamificationViewModel>(builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                'Please review your answers below and do change if any or confirm and continue.',
                style: textstyle2),
            const SizedBox(height: 30),
            Text(
              'My personal details 🙂',
              style: textstyle.copyWith(
                color: const Color(0xFFFBAA29),
              ),
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: 'My name is ', style: textstyle2),
                  TextSpan(
                    text: value.name,
                    style: textstyle2.copyWith(
                        decoration: TextDecoration.underline),
                  ),
                  const TextSpan(text: ' I am a ', style: textstyle2),
                  TextSpan(
                    text: value.gender,
                    style: textstyle2.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const TextSpan(text: ' \nborn on ', style: textstyle2),
                  TextSpan(
                    text: value.dob != null
                        ? DateFormat('dd MMMM yyyy').format(value.dob!)
                        : 'N/A',
                    style: textstyle2.copyWith(
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text('How I keep busy 💻',
                style: textstyle.copyWith(
                  color: const Color(0xFFFBAA29),
                )),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: 'I am ', style: textstyle2),
                  TextSpan(
                    text: value.profession,
                    style: textstyle2.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const TextSpan(text: ' and I develop ', style: textstyle2),
                  TextSpan(
                    text: value.develop,
                    style: textstyle2.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      value.reset();
                    },
                    child: Container(
                      height: 45,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFBAA29),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Icon(Icons.refresh_rounded,
                          color: Colors.black),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: BuildCustomButton(
                    label: 'Confirm',
                    onPressed: () {
                      _showSuccessDialog(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }

  Future<dynamic> _showSuccessDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 0,
          content: Container(
            width: 350,
            height: 150,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset('assets/icon_close_circle_.jpg'),
                ),
                const Spacer(),
                const Center(
                  child: Text(
                    'Success 🎉',
                    style: TextStyle(
                      color: Color(0xFF060606),
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
