// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:packages_app/fitness_app/Models/exercises_model.dart';
import 'package:http/http.dart' as http;
import 'package:packages_app/fitness_app/Modules/exercises_start_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String apiUrl =
      "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json";

  ExercisesModel? exercisesModel;
  @override
  void initState() {
    getExercises();
    super.initState();
  }

  Future<ExercisesModel?> getExercises() async {
    var response = await http.get(Uri.parse(apiUrl));
    var body = response.body;
    var decodedJson = jsonDecode(body);
    setState(() {
      exercisesModel = ExercisesModel.fromJson(decodedJson);
    });
    return exercisesModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Fitness Application')),
      ),
      body: exercisesModel != null
          ? ListView.builder(
              itemBuilder: (context, index) => InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExercisesStartScreen(
                        exercises: exercisesModel!.exercises![index],
                      ),
                    )),
                child: Hero(
                  tag: exercisesModel!.exercises![index].id!,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Stack(
                        children: [
                          FadeInImage(
                            placeholder:
                                AssetImage("assets/images/placeholder.jpg"),
                            image: NetworkImage(
                                exercisesModel!.exercises![index].thumbnail!),
                            width: MediaQuery.of(context).size.width,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 250,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: const [
                                  Colors.black87,
                                  Colors.white10,
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.center,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 250,
                            padding: EdgeInsets.only(
                              left: 10,
                              bottom: 10,
                            ),
                            child: Text(
                              exercisesModel!.exercises![index].title!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                            alignment: Alignment.bottomLeft,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              itemCount: exercisesModel!.exercises!.length,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
