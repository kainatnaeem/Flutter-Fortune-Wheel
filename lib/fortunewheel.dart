import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rxdart/rxdart.dart';

class SpinWheel extends StatefulWidget {
  const SpinWheel({Key? key}) : super(key: key);

  @override
  State<SpinWheel> createState() => _SpinWheelState();
}

class _SpinWheelState extends State<SpinWheel> {
  final controller = ConfettiController();
//  StreamController<int> selected =StreamController.broadcast();
  final selected = BehaviorSubject<int>();
  String rewards = "Which langugage is best for you!";
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      isPlaying = controller.state == ConfettiControllerState.playing;
    });
  }

  @override
  void dispose() {
    selected.close();
    //  controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final language = <String>[
      'Dart',
      'C++',
      'C',
      'Python',
      'Ruby',
      'Java',
      'Perl',
      'SQL',
    ];
    return Stack(alignment: Alignment.topCenter, children: [
      Image.asset(
        "images/b3.jpg",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        // Color.fromARGB(255, 116, 155, 187),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildResultWidget(),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 250,
                width: 300,
                child: buildFortuneWheel(language),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected.add(Fortune.randomInt(0, language.length));
                    controller.stop();
                  });
                },
                child: spinButton(),
              ),
            ],
          ),
        ),
      ),
      buildConfettiWidget()
    ]);
  }

  Container buildResultWidget() {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 184, 129, 32),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      height: 80,
      width: 250,
      child: Center(
        child: Text(
          rewards.toString(),
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  ConfettiWidget buildConfettiWidget() {
    return ConfettiWidget(
      confettiController: controller,
      shouldLoop: false,
      blastDirectionality: BlastDirectionality.explosive,
      emissionFrequency: 0,
      numberOfParticles: 15,
    );
  }

  Container spinButton() {
    return Container(
      height: 40,
      width: 120,
      decoration: const BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: const Center(
        child: Text("Spin"),
      ),
    );
  }

  FortuneWheel buildFortuneWheel(List<String> language) {
    return FortuneWheel(
      selected: selected.stream,
      animateFirst: false,
      items: [
        for (int i = 0; i < language.length; i++) ...<FortuneItem>{
          FortuneItem(child: Text(language[i])),
        },
      ],
      onAnimationEnd: () {
        setState(() {
          rewards = language[selected.value];
        });

        print(rewards);

        controller.play();
//                    Future.delayed(Duration(seconds: 1000));
//  controller.stop();

        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text("You just won " + rewards.toString() + " Points!"),
        //   ),
        //  );
      },
    );
  }
}
