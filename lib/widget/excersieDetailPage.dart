import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:collection/collection.dart';
import '../constant/colors.dart';
import '../data/excersie.dart';
import '../model/excersieModel.dart';

class ExcerciseDetailPge extends StatefulWidget {
  static String routName = 'ExcerciseDetailPge';
  const ExcerciseDetailPge({super.key});

  @override
  State<ExcerciseDetailPge> createState() => _ExcerciseDetailPgeState();
}

class _ExcerciseDetailPgeState extends State<ExcerciseDetailPge> {
  @override
  Widget build(BuildContext context) {
    final exerciseModel =
        ModalRoute.of(context)!.settings.arguments as ExerciseModel;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    exerciseModel.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    exerciseModel.name,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal),
                  ),
                ),
                const Divider(
                  color: black,
                ),
                ...exerciseModel.steps.mapIndexed(
                  (index, element) => ListTile(
                    title: Text('$element'),
                    leading: CircleAvatar(child: Text('${index + 1}')),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Targated Muscle',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal),
                ),
                Row(
                    children: exerciseModel.targetMuscles
                        .map((e) => Card(
                              color: red,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                      color: white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                            ))
                        .toList()),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Equipment ',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal),
                ),
                Row(
                    children: exerciseModel.equipment
                        .map((e) => Card(
                              color: const Color(0xff322751),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                      color: white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                            ))
                        .toList()),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.repeat,
                            color: white,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text('${exerciseModel.reps}')
                      ],
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Icon(
                            Icons.fitness_center,
                            color: white,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text('${exerciseModel.sets}')
                      ],
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.orange,
                          child: Icon(
                            Icons.timer,
                            color: white,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text('${exerciseModel.duration}')
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                )
              ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ExerciseModel model = exerciseList
              .firstWhere((element) => element.name == exerciseModel.name);
          print('ok ${model.isFavourite}  $model');
          setState(() {
            model.isFavourite = !model.isFavourite;
          });
        },
        backgroundColor: white,
        child: Icon(
          exerciseModel.isFavourite == true
              ? Icons.favorite
              : Icons.favorite_border,
          color: exerciseModel.isFavourite == true ? Colors.red : Colors.grey,
        ),
      ),
    );
  }
}
