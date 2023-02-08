// ignore_for_file: avoid_print, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:packages_app/fitness_app/Models/exercises_model.dart';
import 'package:packages_app/fitness_app/Modules/exercises_screen.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ExercisesStartScreen extends StatelessWidget {
  ExercisesStartScreen({Key? key, this.exercises}) : super(key: key);
  Exercises? exercises;
  int seconds=10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Hero(
              tag: exercises!.id!,
              child: Image(
                image: NetworkImage(exercises!.thumbnail!),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF000000),
                  Color(0x00000000),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Container(
              width: 200,
              height: 200,
              child: SleekCircularSlider(
                appearance: const CircularSliderAppearance(),
                initialValue: 10,
                max: 60,
                min: 10,
                onChange: (double value) {
                  seconds = value.toInt();
                },
                innerWidget: (value) {
                  return Center(
                    child: Text(
                      '${value.toInt().toString()} S',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  );
                },
              ),
            ),
          ),
          Center(
            child: MaterialButton(
              height: 50,
              minWidth: 50,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ExercisesScreen(
                              exercises: exercises,
                              seconds: seconds,
                              
                            )));
              },
              child: const Text('Start Exercise'),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }
}
