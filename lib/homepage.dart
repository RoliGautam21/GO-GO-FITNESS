import 'package:calculator/widget/app_state.dart';
import 'package:calculator/widget/bmiPge.dart';
import 'package:calculator/widget/excersie_Card_.dart';
import 'package:calculator/widget/filter.dart';
import 'package:calculator/widget/workoutCategory.dart';
import 'package:flutter/material.dart';

import 'constant/colors.dart';
import 'data/excersie.dart';
import 'data/workoutCategorydata.dart';

class HomePage extends StatefulWidget {
  static String routName = 'homePage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              const Text(
                'GYM GUIDE ',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, BmiPage.routeName);
                },
                title: const Text(
                  ' BMI Calculator',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, FilterPage.routeName);
                },
                title: const Text(
                  ' Filter ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Welcome ',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: white,
              fontStyle: FontStyle.italic),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('asset/images/logo.png'),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                index == 0 ? 'Workout Categories' : 'Favourite Excercise',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic),
              ),
              const Divider(),
              index == 0
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: workoutCategorylist.length,
                      itemBuilder: (context, index) {
                        return WorkoutCategoryView(
                          workoutCategoryModel: workoutCategorylist[index],
                        );
                      },
                    )
                  : exerciseList
                          .where((element) => element.isFavourite == true)
                          .toList()
                          .isEmpty
                      ? SizedBox(
                          height: 500,
                          child: const Center(
                            child: Text(
                              'Not found Excercises marked as favourite   ',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: exerciseList
                              .where((element) => element.isFavourite == true)
                              .toList()
                              .length,
                          itemBuilder: (context, index) {
                            return ExcersiseCardWidget(
                              exerciseModel: exerciseList
                                  .where(
                                      (element) => element.isFavourite == true)
                                  .toList()[index],
                            );
                          },
                        )

              // ...workoutCategorylist
              //     .map((e) => WorkoutCategoryView(
              //           workoutCategoryModel: e,
              //         ))
              //     .toList()
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_sharp), label: 'Favourite'),
        ],
        currentIndex: index,
        onTap: (value) {
          index = value;
          setState(() {});
        },
      ),
    );
  }
}
