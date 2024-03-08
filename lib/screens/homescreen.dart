import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:scattertest/providers/statusprovider.dart';

import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late double top;
  // late double left;
  late List<Map<String,dynamic>> emotions;
  bool loadedEmotions = false;

  _setDragablePosition(Offset offset, String key, double offsetY) {
    setState(() {
      // Update position when the draggable is dropped
      Map<String,dynamic> emotion = emotions.firstWhere((element) => element["name"] == key);
      emotion['top'] = (offset.dy - offsetY) - 40;
      emotion['left'] = offset.dx;
    });
  }

  @override
  void initState() {
    super.initState();
    Random random = Random();
    print('Random ${random.nextDouble() * 400}');
    emotions = [
      // {
      //   "name" : "anger", 
      //   "top" : random.nextDouble() * 400,
      //   "left" :  random.nextDouble() * 300,
      // },
      // {
      //   "name" : "jealousy", 
      //   "top" : random.nextDouble() * 400,
      //   "left" :  random.nextDouble() * 300,
      // },
      // {
      //   "name" : "horney", 
      //   "top" : random.nextDouble() * 400,
      //   "left" :  random.nextDouble() * 300,
      // },
      // {
      //   "name" : "frustration", 
      //   "top" : random.nextDouble() * 400,
      //   "left" :  random.nextDouble() * 300,
      // },
      // {
      //   "name" : "sad", 
      //   "top" : random.nextDouble() * 400,
      //   "left" :  random.nextDouble() * 300,
      // },
    ];


  }


  @override
  Widget build(BuildContext context) {
    //final statusProvider = Provider.of<StatusProvider>(context, listen: true);

    // if(!loadedEmotions) {
    //   loadedEmotions = true;
    //   Random random = Random();
    //   setState(() {
    //     emotions = [
    //       {
    //         "name" : "anger", 
    //         "top" : random.nextDouble() * 400,
    //         "left" :  random.nextDouble() * 300,
    //       },
    //       {
    //         "name" : "jealousy", 
    //         "top" : random.nextDouble() * 400,
    //         "left" :  random.nextDouble() * 300,
    //       },
    //       {
    //         "name" : "horney", 
    //         "top" : random.nextDouble() * 400,
    //         "left" :  random.nextDouble() * 300,
    //       },
    //       {
    //         "name" : "frustration", 
    //         "top" : random.nextDouble() * 400,
    //         "left" :  random.nextDouble() * 300,
    //       },
    //       {
    //         "name" : "sad", 
    //         "top" : random.nextDouble() * 400,
    //         "left" :  random.nextDouble() * 300,
    //       },
    //     ];
    //   });
    // }

    List<DragableEmotion> _getDragableEmotions(double offset) {
      Random random = Random();
      List<DragableEmotion> emotionWidgets = [];

      print('GETTING $offset');

      for(var emotion in emotions) {
        emotionWidgets.add(
          DragableEmotion(
            key: ValueKey(emotion['name']),
            top: emotion['top'], 
            left: emotion['left'],
            offsetY: offset, 
            name: emotion['name'], 
            draggedAction: _setDragablePosition
          )
        );
      }
      
      // List<DragableEmotion> emotionWidgets = [
      //   DragableEmotion(
      //     top: emotions[0]['top'],
      //     left: emotions[0]['left'],
      //     name: emotions[0]['name'],
      //     draggedAction: _setDragablePosition,
      //   )
      // ];
      return emotionWidgets;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scatter Test'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenHeight = MediaQuery.of(context).size.height;
          double screenWidth = MediaQuery.of(context).size.width;

          print('The screen is $screenWidth * ${constraints.maxHeight}');


          if(!loadedEmotions) {
            loadedEmotions = true;
            Random random = Random();
            //setState(() {
              emotions = [
                {
                  "name" : "anger", 
                  "top" : random.nextDouble() * (constraints.maxHeight - 300),
                  "left" :  random.nextDouble() * 300,
                },
                {
                  "name" : "jealousy", 
                  "top" : random.nextDouble() * (constraints.maxHeight - 300),
                  "left" :  random.nextDouble() * 300,
                },
                {
                  "name" : "horney", 
                  "top" : random.nextDouble() * (constraints.maxHeight - 300),
                  "left" :  random.nextDouble() * 300,
                },
                {
                  "name" : "frustration", 
                  "top" : random.nextDouble() * (constraints.maxHeight - 300),
                  "left" :  random.nextDouble() * 300,
                },
                {
                  "name" : "sad", 
                  "top" : random.nextDouble() * (constraints.maxHeight - 300),
                  "left" :  random.nextDouble() * 300,
                },
              ];
            //});
          }

          // if(constraints.maxHeight < 600) {
          //   statusProvider.setMainContainerHeight(constraints.maxHeight);
          // } else {
          //   statusProvider.setMainContainerHeight(constraints.maxHeight  * .76);
          // }
          return Column(
            children: [
              Container(
                color: Colors.blue,
                height: 300,
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(
                height: constraints.maxHeight - 300,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: _getDragableEmotions(300),
                ),
              )
            ] 
,
          );
        },
      ),
    );
  }
}

// class DraggableWidget extends StatefulWidget {
//   final String label;

//   const DraggableWidget({
//     required this.label,
//     super.key
//   });

//   @override
//   _DraggableWidgetState createState() => _DraggableWidgetState();
// }

// class _DraggableWidgetState extends State<DraggableWidget> {
//   Random random = Random();
//   late double top;
//   late double left;

//   @override
//   void initState() {
//     super.initState();
//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;

//     print('The screen is $screenWidth * $screenHeight');
//     // Initialize top and left positions with random values
//     top = random.nextDouble() * 400;
//     left = random.nextDouble() * 300;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         //DragableEmotion(top: top, left: left),
//       ],
//     );
//   }
// }

class DragableEmotion extends StatefulWidget {
  const DragableEmotion({
    super.key,
    required this.top,
    required this.left,
    required this.offsetY,
    required this.name,
    required this.draggedAction,
  });

  final double top;
  final double left;
  final double offsetY;
  final String name;
  final Function draggedAction;

  @override
  State<DragableEmotion> createState() => _DragableEmotionState();
}

class _DragableEmotionState extends State<DragableEmotion> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.top,
      left: widget.left,
      child: Draggable(
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/heart.svg',
              colorFilter: ColorFilter.mode(
                Colors.red, // Change this to your desired color
                BlendMode.srcIn, // This mode applies the color to the SVG
              ),
              width: 40,
              height: 40,
            ),
            Text(widget.name),
          ],
        ),
        feedback: Column(
          children: [
            SvgPicture.asset(
              'assets/heart.svg',
              colorFilter: ColorFilter.mode(
                Colors.red.shade200, // Change this to your desired color
                BlendMode.srcIn, // This mode applies the color to the SVG
              )
            )
          ],
        ),
        onDraggableCanceled: (velocity, offset) {
          widget.draggedAction(offset,widget.name,widget.offsetY);
        },
      ),
    );
  }
}