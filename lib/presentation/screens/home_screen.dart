import 'package:dynamic_elred/presentation/screens/summary_screen.dart';
import 'package:dynamic_elred/provider/gamification_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<GamificationProvider>();
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 42),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (provider.currentIndex != 0)
                      IconButton(
                        onPressed: () {
                          if (provider.currentScreen is SummaryScreen) {
                            provider.changeIndex(3);
                          } else {
                            provider.decrementIndex();
                          }
                        },
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.white,
                      ),
                    const Spacer(),
                    Text(
                      provider.currentIndex != 5
                          ? 'Gamification'
                          : 'Profile Summary',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            if (provider.currentIndex == provider.screens.length - 1) ...[
              Column(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Hi, ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: context.read<GamificationProvider>().name,
                          style: const TextStyle(
                            color: Color(0xFFFBAA29),
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'You did it 🎉',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ] else ...[
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: _buildHeadingText(context),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: LinearProgressIndicator(
                  value: provider.progress,
                  color: const Color(0xFFFBAA29),
                  backgroundColor: Colors.white,
                ),
              ),
            ],
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: provider.currentScreen,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _buildHeadingText(BuildContext context) {
    final currentIndex = context.watch<GamificationProvider>().currentIndex;

    if (currentIndex <= 2) {
      return const Text(
        'A few personal details 🙂',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      );
    } else {
      return const Text(
        'Something about how you keep\nbusy. 💻',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      );
    }
  }
}
