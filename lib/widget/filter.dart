import 'package:flutter/material.dart';

import '../constant/colors.dart';
import 'app_state.dart';

enum Equipment { noEquipment, equiment, both }

class FilterPage extends StatefulWidget {
  static String routeName = '/FilterPage';
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Filter ',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: white,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.fitness_center,
              color: mythemColor,
            ),
            title: Text(
              'Equipment ',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
            ),
          ),
          RadioListTile(
              activeColor: mythemColor,
              title: Text(
                'Equipment ',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
              ),
              value: Equipment.equiment,
              groupValue: AppState.selectedEquipemt,
              onChanged: (value) {
                AppState.selectedEquipemt = value!;
                setState(() {});
              }),
          RadioListTile(
              activeColor: mythemColor,
              title: Text(
                'No Equipment ',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
              ),
              value: Equipment.noEquipment,
              groupValue: AppState.selectedEquipemt,
              onChanged: (value) {
                AppState.selectedEquipemt = value!;
                setState(() {});
              }),
          RadioListTile(
              activeColor: mythemColor,
              title: Text(
                'Both ',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
              ),
              value: Equipment.both,
              groupValue: AppState.selectedEquipemt,
              onChanged: (value) {
                AppState.selectedEquipemt = value!;
                setState(() {});
              }),
          ListTile(
            leading: Icon(
              Icons.timer_rounded,
              color: mythemColor,
            ),
            title: Text(
              'Difficulty level ',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
            ),
          ),
          Slider(
            divisions: 5,
            label: '${AppState.difficltyLevel}',
          
            min: 1,
            max: 5,
            value: AppState.difficltyLevel,
            onChanged: (value) {
              AppState.difficltyLevel = value;
              setState(() {});
            },
          )
        ],
      )),
    );
  }
}
