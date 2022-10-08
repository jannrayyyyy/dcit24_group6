import 'package:dcit24/domain/entities/prulife_entity.dart';
import 'package:dcit24/presentation/widget/custom/custom_text.dart';
import 'package:flutter/material.dart';

class PrulifeTable extends StatelessWidget {
  final PrulifeEntity e;
  const PrulifeTable({super.key, required this.e});

  @override
  Widget build(BuildContext context) {
    return rowBuilder(
      e.fundName,
      e.bondFund,
      e.managedFund,
      e.growthFund,
      e.equityFund,
      e.proactivefund,
      e.moneyMarketFund,
      30,
    );
  }
}

Widget expandedBuilder(String label, double height) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white),
      ),
      height: height,
      alignment: Alignment.center,
      child: CustomText(
        text: label,
        color: Colors.white,
        size: 18,
      ),
    ),
  );
}

Widget rowBuilder(
  String fundname,
  String bondFund,
  String managedFund,
  String growthFund,
  String equityFund,
  String proactiveFund,
  String moneyMadeFund,
  double height,
) {
  return Row(
    children: [
      expandedBuilder(fundname, height),
      expandedBuilder(bondFund, height),
      expandedBuilder(managedFund, height),
      expandedBuilder(growthFund, height),
      expandedBuilder(equityFund, height),
      expandedBuilder(proactiveFund, height),
      expandedBuilder(moneyMadeFund, height),
    ],
  );
}
