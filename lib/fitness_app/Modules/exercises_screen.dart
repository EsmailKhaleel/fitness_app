// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:packages_app/fitness_app/Models/exercises_model.dart';

class ExercisesScreen extends StatefulWidget {
  Exercises? exercises;
  int? seconds;
  ExercisesScreen({Key? key, this.exercises, this.seconds}) : super(key: key);

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  final bool _isCompleted = false;
  int _elapsedSeconds = 0;
  Timer? timer;
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (timer.tick == widget.seconds) {
          setState(() {
            _isCompleted == true;
          });
          timer.cancel();
          playAudio();
        }
        setState(() {
          _elapsedSeconds = timer.tick;
        });
      },
    );
  }

  playAudio() {
    audioCache.play("cheering.wav");
  }

  @override
  void dispose() {
    timer!.cancel();
    audioCache.clearAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: FadeInImage(
              placeholder: AssetImage("assets/images/placeholder.jpg"),
              image: NetworkImage(widget.exercises!.gif!),
              width: MediaQuery.of(context).size.width,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          _isCompleted != true
              ? SafeArea(
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      '$_elapsedSeconds/${widget.seconds} Sec',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                )
              : SafeArea(
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      '$_elapsedSeconds/${widget.seconds} Sec\nCompleted',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
          SafeArea(
            child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.close)),
          ),
        ],
      ),
    );
  }
}
