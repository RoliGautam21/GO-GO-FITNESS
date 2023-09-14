import 'package:flutter/material.dart';

import '../constant/colors.dart';

enum Gender { male, female }

class BmiPage extends StatefulWidget {
  static String routeName = '/BmiPage';
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  double wheight = 1;
  TextEditingController heightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  Gender gender = Gender.female;
  double bmiValue = 0;
  var result = '';
  CalulateBmi() {
    double height = double.parse(heightController.text);
    double _wight = wheight;
    if (gender == Gender.male) {
      bmiValue = _wight / (height * height) * 10000;
    } else {
      bmiValue = _wight / (height * height) * 10000 * 0.9;
    }
    if (bmiValue < 18.5) {
      result = "Underweight";
    } else if (bmiValue >= 18.5 && bmiValue < 24.9) {
      result = "Normal";
    } else if (bmiValue >= 25 && bmiValue < 29.9) {
      result = "Overweight";
    } else {
      result = "Obese";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator ',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: white,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 100,
              decoration: BoxDecoration(color: Colors.grey.shade100),
              child: Column(children: [
                const Text(
                  ' Weight in kg ',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal),
                ),
                Text(
                  '${wheight.truncate()} Kg ',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal),
                ),
                Slider(
                  value: wheight,
                  onChanged: (value) {
                    wheight = value;
                    setState(() {});
                  },
                  min: 1,
                  max: 180,
                  activeColor: mythemColor,
                )
              ]),
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Hight in CM',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    gender = Gender.female;
                    setState(() {});
                  },
                  child: Card(
                      color: gender == Gender.female
                          ? Colors.pink.shade100
                          : white,
                      child: Container(
                        alignment: Alignment.center,
                        height: 130,
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Female',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Icon(
                              Icons.check_circle,
                              color: gender == Gender.female ? green : black,
                            )
                          ],
                        ),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    gender = Gender.male;
                    setState(() {});
                  },
                  child: Card(
                      color: gender == Gender.male
                          ? Colors.green.shade200
                          : Colors.white,
                      child: Container(
                        alignment: Alignment.center,
                        height: 130,
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Male',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Icon(
                              Icons.check_circle,
                              color:
                                  gender == Gender.male ? green : Colors.black,
                            )
                          ],
                        ),
                      )),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              minWidth: 300,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Color(0xff322751),
              onPressed: () {
                CalulateBmi();
              },
              child: Text(
                'Calculate BMI',
                style: TextStyle(color: white, fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Your BMI is :  ${bmiValue!.toStringAsFixed(2)} \n You are $result',
              style: TextStyle(
                  color: black, fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ]),
        ),
      ),
    );
  }
}
