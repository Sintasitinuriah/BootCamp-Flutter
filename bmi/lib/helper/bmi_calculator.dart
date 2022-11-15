import '../constants/constant.dart';

class BmiCalculator {
  int? height;
  int? weight;
  double? bmi;
  String? bmicategory;
  String? bmiDescription;

  BmiCalculator({required this.height, required this.weight});
  BmiCalculator.fromBMIValeu(this.bmi) {
    //this.bmi = bmi;
  }

  double calcutateBmi() {
    double heightInMeter = height! / 100;
    final h = (heightInMeter * heightInMeter);
    bmi = weight! / h;

    return bmi!;
  }

  determinBmiCategory() {
    String category = "";
    if (bmi! < 16.0) {
      category = underweightSevere;
    } else if (bmi! < 17) {
      category = underweightModerate;
    } else if (bmi! < 18.5) {
      category = underweightMild;
    } else if (bmi! < 25) {
      category = normal;
    } else if (bmi! < 30) {
      category = overweight;
    } else if (bmi! < 35) {
      category = obeseI;
    } else if (bmi! < 40) {
      category = obeseII;
    } else if (bmi! >= 40) {
      category = obeseIII;
    }
    bmicategory = category;

    return bmicategory!;
  }

  String getHealRiskDescription() {
    String desc = "";
    switch (bmicategory) {
      case underweightSevere:
        desc = "Possible nutritional defiency and osteoporpsis";
        break;
      case underweightModerate:
        desc = "Possible nutritional defiency and osteoporpsis";
        break;
      case underweightMild:
        desc = "Possible nutritional defiency and osteoporpsis";
        break;
      case normal:
        desc = "Low risk (healty range).";
        break;
      case overweight:
        desc =
            "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus";
        break;
      case obeseI:
        desc =
            "High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus. Metabolic Syndrome";
        break;
      case obeseII:
        desc =
            "High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus. Metabolic Syndrome";
        break;
      case obeseIII:
        desc =
            "High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus. Metabolic Syndrome";
        break;
      default:
    }
    bmiDescription = desc;

    return desc;
  }
}
