import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    backgroundColor: Colors.indigo,
    appBar: AppBar(
      title: Text('تطابق صور'),
      backgroundColor: Colors.indigo[800],
    ),
    body: ImagePage(),
  )));
}

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  int leftImageNumber = 1;
  int RightImageNumber = 2;
  void ChangImage() {
    leftImageNumber = Random().nextInt(8) + 1;
    RightImageNumber = Random().nextInt(8) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          leftImageNumber == RightImageNumber
              ? 'مبروك لقد نجحت'
              : 'حاول مرة اخرى',
          style: TextStyle(
            fontSize: 42.0,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          ChangImage();
                        });
                      },
                      child: Image.asset('images/image-$leftImageNumber.png'))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          ChangImage();
                        });
                      },
                      child: Image.asset('images/image-$RightImageNumber.png')))
            ],
          ),
        )
      ],
    );
  }
}
