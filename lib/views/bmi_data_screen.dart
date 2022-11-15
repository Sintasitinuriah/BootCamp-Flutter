import 'package:bmi/constants/constant.dart';
import 'package:bmi/helper/bmi_calculator.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({super.key});

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int? height = 100;
  int? weight = 50;
  int? age = 20;

  String? gender;

  List<Widget> generateList(start, end) {
    List<Widget> weights = [];
    for (var i = start; i < end; i++) {
      weights.add(
        Text(
          "$i",
          style: labelTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
      );
    }
    return weights;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xff0a0e21),
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          final bmiCalculator = BmiCalculator(height: height, weight: weight);
          bmiCalculator.calcutateBmi();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) {
                return BmiResultScreen(
                  bmi: bmiCalculator.bmi!,
                );
              }),
            ),
          );
        },
        child: Container(
          height: 60,
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color.fromARGB(255, 18, 157, 3),
          ),
          child: const Center(
            child: Text(
              "BMI Hitung",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      body: Column(children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: (() {
                  gender = "Laki-laki";
                  setState(() {});
                }),
                child: BmiCard(
                  borderColor:
                      (gender == "Laki-laki") ? Colors.white : primaryColor,
                  child: Stack(
                    children: [
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: GenderIconText(
                            icon: Icons.male,
                            title: 'Laki-laki',
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Icon(
                          Icons.check_circle,
                          color: (gender == "Laki-laki")
                              ? Colors.white
                              : primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  gender = "Perempuan";

                  setState(() {});
                },
                child: BmiCard(
                  borderColor:
                      (gender == "Perempuan") ? Colors.white : primaryColor,
                  child: Stack(
                    children: [
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: GenderIconText(
                            icon: Icons.female,
                            title: 'Perempuan',
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Icon(
                          Icons.check_circle,
                          color: (gender == "Perempuan")
                              ? Colors.white
                              : primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "TINGGI",
              style: labelTextStyle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Slider(
                    value: height!.toDouble(),
                    min: 80,
                    max: 200,
                    thumbColor: Color.fromARGB(255, 18, 157, 3),
                    activeColor: Colors.black,
                    onChanged: (value) {
                      height = value.toInt();
                      setState(() {});
                    },
                  ),
                ),
                BmiCard(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 15.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "$height",
                          style: labelTextStyle,
                        ),
                        Text(
                          " cm",
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "WEIGHT",
                    style: labelTextStyle,
                  ),
                  BmiCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: CupertinoPicker(
                            scrollController:
                                FixedExtentScrollController(initialItem: 30),
                            itemExtent: 25,
                            magnification: 2,
                            useMagnifier: true,
                            onSelectedItemChanged: (val) {
                              weight = val + 20;
                            },
                            children: generateList(20, 220),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    "UMUR",
                    style: labelTextStyle,
                  ),
                  BmiCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 8),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: CupertinoPicker(
                            scrollController:
                                FixedExtentScrollController(initialItem: 5),
                            itemExtent: 25,
                            magnification: 2,
                            useMagnifier: true,
                            onSelectedItemChanged: (val) {
                              weight = val + 20;
                            },
                            children: generateList(15, 90),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff272a4e),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor!),
      ),
      margin: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff272a4e),
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(15),
        child: child,
      ),
    );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Color.fromARGB(255, 18, 157, 3),
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 18, 157, 3),
          ),
        ),
      ],
    );
  }
}
