import '../../helpers/test_style.dart';
import 'child_view.dart';
import 'summary_screen.dart';
import '../../provider/gamification_provider.dart';
import '../../services/gamification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ParentScreen extends StatefulWidget {
  const ParentScreen({super.key});

  @override
  State<ParentScreen> createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    GamificationService.fetchJson().then((value) {
      setState(() {
        _isLoading = false;
      });
      context.read<GamificationProvider>().setResponseAndScreen(value);
    });
    super.initState();
  }

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
                    if (!provider.showSummary)
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
                      style: textstyle.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            if (provider.showSummary) ...[
              Column(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Hi, ',
                          style: textstyle.copyWith(color: Colors.white),
                        ),
                        TextSpan(
                          text: context.read<GamificationProvider>().name,
                          style: textstyle.copyWith(
                              color: const Color(0xFFFBAA29)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'You did it 🎉',
                    style:
                        textstyle.copyWith(fontSize: 30, color: Colors.white),
                  )
                ],
              ),
            ] else ...[
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      provider.currentScreen.heading,
                      style: textstyle.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: 6,
                    child: LinearProgressIndicator(
                      value: provider.progress,
                      color: const Color(0xFFFBAA29),
                      backgroundColor: Colors.white,
                    ),
                  ),
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
                  child: _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ChildView(screen: provider.currentScreen),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}