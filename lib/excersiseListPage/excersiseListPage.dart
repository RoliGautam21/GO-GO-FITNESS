import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../data/excersie.dart';
import '../model/excersieModel.dart';
import '../widget/app_state.dart';
import '../widget/excersie_Card_.dart';

class ExcersiseListPage extends StatelessWidget {
  static String routName = 'excersiseListPage';
  const ExcersiseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final title = args['title'] as String;
    final List<ExerciseModel> listOfExcercise = args['listOfExcercise'];
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(color: white),
          title: Text(
            '$title',
            style: const TextStyle(
                color: white,
                fontSize: 20,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: listOfExcercise.isEmpty
                ? Center(
                    child: Text(
                      'Not Found Excercises with defficulty level :${AppState.difficltyLevel} and  equipment type ${AppState.selectedEquipemt}',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal),
                      textAlign: TextAlign.center ,
                    ),
                  )
                : ListView.separated(
                    physics: BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                    itemCount: listOfExcercise.length,
                    itemBuilder: (context, index) {
                      return ExcersiseCardWidget(
                        exerciseModel: listOfExcercise[index],
                      );
                    },
                  )));
  }
}
