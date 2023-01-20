import 'dart:async';

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
Widget _text(var snapshot) {
  //here you cand get and handle the result and do whathever.
 // print(snapshot.data);
  String val = snapshot.data as String;
  print(val);
  
  return Text(snapshot.data.toString()); //you dont need to return //anything here.  Just replace the Text widget with SizedBox() to return //nothing.
  }

void initState(){
  super.initState();
  // controller.play();
  // selected.stream.listen((value) {
  //     print('Value from controller: $value');
  //   });
  controller.addListener(() {
  isPlaying = controller.state== ConfettiControllerState.playing;
  
});
}

  // List<String> items = [
  //  " Python", "C++"," Dart", "Java", "C"
  // ];

  @override
  void dispose() {
    selected.close();
  //  controller.dispose();
    super.dispose();
  }
// Widget _text(var snapshot) {
//   //here you cand get and handle the result and do whathever.
//   print(snapshot.data);
//   int val = snapshot.data;
//   print(selected[val]);
  
//   return Text(snapshot.data.toString()); //you dont need to return //anything here.  Just replace the Text widget with SizedBox() to return //nothing.
//   }
  @override
  Widget build(BuildContext context) {
     final language= <String>[
      'Dart',
      'C++',
      'C',
      'Python',
      'Ruby',
      'Java',
      'Perl',
      'SQL',
    ];
    return Stack(
      
      alignment:Alignment.topCenter,
      children:[
         Image.asset(
            "images/b3.jpg",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        
         Scaffold(
        backgroundColor:Colors.transparent,
        // Color.fromARGB(255, 116, 155, 187),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container( decoration: BoxDecoration(  color:Color.fromARGB(255, 184, 129, 32),
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
          height: 80,
          width: 250,
            
          child: Center(
            child: Text(rewards.toString(),style: TextStyle(fontWeight:FontWeight.w700),),
          ),
        ),
      ),
  
    SizedBox(height: 20,),
              SizedBox(
                height: 250, width:300,

                child: FortuneWheel(
                //  styleStrategy: const UniformStyleStrategy(
    
                //   borderColor: Colors.white,
                //   color: Colors.purple,
                //   borderWidth: 3,
                // ),
                  selected: selected.stream,
                  animateFirst: false,
                  items:[
                    for(int i = 0; i < language.length; i++)...<FortuneItem>{
                      FortuneItem(child: Text(language[i])),
                   },
    //              FortuneItem(
    //   child: Text('Dart',style: TextStyle(color:Colors.black),),
    //   style: FortuneItemStyle(
    //     color: Colors.orange, // <-- custom circle slice fill color
    //    // borderColor: Colors.green, // <-- custom circle slice stroke color
    //    // borderWidth: 3, // <-- custom circle slice stroke width
    //   ),
    // ), FortuneItem(
    //   child: Text('Python',style: TextStyle(color:Colors.black)),
    //   style: FortuneItemStyle(
    //     color:Color.fromARGB(255, 184, 129, 32), // <-- custom circle slice fill color
    //     // borderColor: Colors.purple, // <-- custom circle slice stroke color
    //     // borderWidth: 3, // <-- custom circle slice stroke width
    //   ),
    // ),
    //          FortuneItem(
    //   child: Text('C',style: TextStyle(color:Colors.black)),
    //   style: FortuneItemStyle(
    //     color: Colors.orange, // <-- custom circle slice fill color
    //     // borderColor: Colors.blue, // <-- custom circle slice stroke color
    //     // borderWidth: 3, // <-- custom circle slice stroke width
    //   ),
    // ),
    //          FortuneItem(
    //   child: Text('C++',style: TextStyle(color:Colors.black)),
    //   style: FortuneItemStyle(
    //     color:Color.fromARGB(255, 184, 129, 32), // <-- custom circle slice fill color
    //     // borderColor: Colors.pink, // <-- custom circle slice stroke color
    //     // borderWidth: 3, // <-- custom circle slice stroke width
    //   ),
    // )
    //         ,         FortuneItem(
    //   child: Text('Ruby',style: TextStyle(color:Colors.black)),
    //   style: FortuneItemStyle(
    //     color: Colors.orange, // <-- custom circle slice fill color
    //    // borderColor: Colors.green, // <-- custom circle slice stroke color
    //    // borderWidth: 3, // <-- custom circle slice stroke width
    //   ),
    // ), FortuneItem(
    //   child: Text('Java',style: TextStyle(color:Colors.black)),
    //   style: FortuneItemStyle(
    //     color: Color.fromARGB(255, 184, 129, 32), // <-- custom circle slice fill color
    //     // borderColor: Colors.purple, // <-- custom circle slice stroke color
    //     // borderWidth: 3, // <-- custom circle slice stroke width
    //   ),
    // ),         FortuneItem(
    //   child: Text('SQL',style: TextStyle(color:Colors.black)),
    //   style: FortuneItemStyle(
    //     color: Colors.orange, // <-- custom circle slice fill color
    //    // borderColor: Colors.green, // <-- custom circle slice stroke color
    //    // borderWidth: 3, // <-- custom circle slice stroke width
    //   ),
    // ), FortuneItem(
    //   child: Text('PHP',style: TextStyle(color:Colors.black)),
    //   style: FortuneItemStyle(
    //     color: Color.fromARGB(255, 184, 129, 32), // <-- custom circle slice fill color
    //     // borderColor: Colors.purple, // <-- custom circle slice stroke color
    //     // borderWidth: 3, // <-- custom circle slice stroke width
    //   ),
    // ),
                  ],
                  onAnimationEnd: () {
                    setState(() {
                      rewards =language[selected.value];
                    });
                    
                    print(rewards);

                  controller.play();
//                    Future.delayed(Duration(seconds: 1000));
//  controller.stop();
  //                 if(isPlaying){
  // controller.play();
  //                 }
  //                 else{
  //                   controller.stop();
  //                 }
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     content: Text("You just won " + rewards.toString() + " Points!"),
                    //   ),
                 //  );
                  },
                 
                ),
              ),SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected.add(Fortune.randomInt(0, language.length)
                    
                    ); controller.stop();
                  }); 
    //               if(isPlaying){
    //   controller.stop();
    //  } else{
    //     controller.play();
    //   }
                },
                child: Container(
                  height: 40,
                  width: 120,
                 decoration: BoxDecoration(  color: Colors.orange,
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
                  child: const Center(
                    child: Text("Spin"),
                  ),
                ),
     
              ),
     
    //  ElevatedButton(
    //   child: Text(isPlaying ? "Stop" : "celebrate"),
    //   onPressed:(){ if(isPlaying){
    //   controller.stop();
    //  } else{
    //     controller.play();
    //   }
    //  }, ),
            ],
          ),
        ),
      ),
      ConfettiWidget(confettiController: controller,
      shouldLoop: false,
      blastDirectionality: BlastDirectionality.explosive,
      
      emissionFrequency: 0,
      numberOfParticles: 15,
      //gravity =2
      // colors:const [Colors.green,Colors.green,Colors.green,Colors.green,
      // ],
      )
   ] );
  }
}