import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _contoler = ConfettiController();
  bool isPlaying = false;
  Random random = Random();
  int x = 0;

  @override
  void dispose() {
    super.dispose();
    _contoler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lottery App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Lottery winning number is 4',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 250,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: x == 4
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.done_all,
                                  color: Colors.green,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Congratulations, you have won the lotery,\nyour number is $x',
                                  textAlign: TextAlign.center,
                                ),
                                ConfettiWidget(
                                  confettiController: _contoler,
                                  blastDirection: -pi / 2,
                                  gravity: 0.02,
                                  emissionFrequency: 0.02,
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Better luck next time your number is $x\ntry again',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                    ),
                    const SizedBox(height: 20),
                    MaterialButton(
                      color: Colors.deepPurple,
                      onPressed: () {
                        if (isPlaying) {
                          _contoler.stop();
                        } else {
                          _contoler.play();
                        }
                        isPlaying = !isPlaying;
                        x = random.nextInt(10);
                        setState(() {});
                      },
                      child: const Text(
                        'Try your luck',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     if (isPlaying) {
      //       _contoler.stop();
      //     } else {
      //       _contoler.play();
      //     }
      //     isPlaying = !isPlaying;
      //     x = random.nextInt(10);
      //     setState(() {});
      //   },
      //   child: const Icon(Icons.refresh),
      // ),
    );
  }
}
