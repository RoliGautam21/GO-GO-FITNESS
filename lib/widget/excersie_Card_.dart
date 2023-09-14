import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../model/excersieModel.dart';
import 'excersieDetailPage.dart';

class ExcersiseCardWidget extends StatelessWidget {
  final ExerciseModel exerciseModel;
  const ExcersiseCardWidget({super.key, required this.exerciseModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ExcerciseDetailPge.routName, arguments: exerciseModel);
      },
      child: Container(
        // height: 290,
        decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 4,
                  spreadRadius: 4)
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.network(
                  exerciseModel.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      exerciseModel.name,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                ),
                Row(
                    children: List.generate(
                        5,
                        (index) => index <= exerciseModel.difficulty
                            ? Icon(
                                Icons.star,
                                color: Colors.orange,
                              )
                            : Icon(
                                Icons.star_border,
                                color: Colors.orange,
                              )))
              ],
            ),
            exerciseModel.equipment.isEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'No Equipemnt',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Equipemnt: ${exerciseModel.equipment.join(',')}',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
