import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../data/excersie.dart';
import '../excersiseListPage/excersiseListPage.dart';
import '../model/excersieModel.dart';
import '../model/workout_categorymodel.dart';
import 'app_state.dart';
import 'filter.dart';

class WorkoutCategoryView extends StatelessWidget {
  WorkoutCategoryModel workoutCategoryModel;
  WorkoutCategoryView({super.key, required this.workoutCategoryModel});

  @override
  Widget build(BuildContext context) {
    List<ExerciseModel> list = [];
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            list = exerciseList
                .where((element) =>
                    element.category == workoutCategoryModel.categorName)
                .where(
                    (element) => element.difficulty <= AppState.difficltyLevel)
                .toList();
            if (AppState.selectedEquipemt == Equipment.noEquipment) {
              list.where((element) => element.equipment.isEmpty).toList();
            } else if (AppState.selectedEquipemt == Equipment.equiment) {
              list.where((element) => element.equipment.isNotEmpty).toList();
            }
            Navigator.of(context).pushNamed(ExcersiseListPage.routName,
                arguments: {
                  'title': workoutCategoryModel.categorName,
                  'listOfExcercise': list
                });
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.network(workoutCategoryModel.image,
                      fit: BoxFit.fitWidth),
                  Container(
                    height: 40,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [white, Colors.black, Colors.transparent])),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        workoutCategoryModel.categorName,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
