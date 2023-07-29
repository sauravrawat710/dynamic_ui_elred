import 'package:dynamic_elred/presentation/widgets/custom_button.dart';
import 'package:dynamic_elred/provider/gamification_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Please review your answers below and do change if any or confirm and continue.',
            style: TextStyle(
              color: Color(0xFF302F2F),
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'My personal details 🙂',
            style: TextStyle(
              color: Color(0xFFFBAA29),
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Text.rich(
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
                  text: context.read<GamificationProvider>().dob != null
                      ? DateFormat('dd MMMM yyyy')
                          .format(context.read<GamificationProvider>().dob!)
                      : 'N/A',
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
          const SizedBox(height: 30),
          const Text(
            'How I keep busy 💻',
            style: TextStyle(
              color: Color(0xFFFBAA29),
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'I am ',
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
                const TextSpan(
                  text: ' and I develop ',
                  style: TextStyle(
                    color: Color(0xFF060606),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                _buildDevelopTextWidget(context),
              ],
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: ShapeDecoration(
                  color: const Color(0xFFFBAA29),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Icon(Icons.refresh_rounded, color: Colors.black),
              ),
              Expanded(
                child: BuildCustomButton(
                  label: 'Confirm',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          elevation: 0,
                          content: Container(
                            width: 150,
                            height: 180,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    iconSize: 20,
                                    onPressed: () {
                                      context
                                          .watch<GamificationProvider>()
                                          .reset();
                                    },
                                    icon: const Icon(Icons.close_rounded,
                                        color: Colors.black),
                                  ),
                                ),
                                const SizedBox(height: 20),
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
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  TextSpan _buildDevelopTextWidget(BuildContext context) {
    final provider = context.read<GamificationProvider>();

    switch (provider.profession) {
      case 'frontend developer':
        return TextSpan(
          text: context.read<GamificationProvider>().develop,
          style: const TextStyle(
            color: Color(0xFF060606),
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
          ),
        );
      case 'backend developer':
        return TextSpan(
          text: context.read<GamificationProvider>().backendTechStack,
          style: const TextStyle(
            color: Color(0xFF060606),
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
          ),
        );
      case 'UI/UX designer':
        return TextSpan(
          text: context.read<GamificationProvider>().uiux,
          style: const TextStyle(
            color: Color(0xFF060606),
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
          ),
        );
      default:
        return TextSpan(
          text: context.read<GamificationProvider>().develop,
          style: const TextStyle(
            color: Color(0xFF060606),
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
          ),
        );
    }
  }
}
