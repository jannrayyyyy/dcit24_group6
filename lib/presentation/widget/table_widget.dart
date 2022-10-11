import 'package:dcit24/core/theme/theme_color.dart';
import 'package:dcit24/domain/entities/prulife_entity.dart';
import 'package:dcit24/presentation/widget/custom/custom_text.dart';
import 'package:flutter/material.dart';

class PrulifeTable extends StatelessWidget {
  final PrulifeEntity e;
  final bool isOdd;
  const PrulifeTable({
    super.key,
    required this.e,
    required this.isOdd,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        rowBuilder(e.fundName, isOdd),
        rowBuilder(e.bondFund, isOdd),
        rowBuilder(e.managedFund, isOdd),
        rowBuilder(e.growthFund, isOdd),
        rowBuilder(e.equityFund, isOdd),
        rowBuilder(e.proactivefund, isOdd),
        rowBuilder(e.moneyMarketFund, isOdd),
      ],
    );
  }
}

Widget rowBuilder(String label, bool isOdd) {
  return Container(
    width: 200,
    margin: const EdgeInsets.all(5),
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      border: Border.all(width: 1),
      color: isOdd ? WHITE : darkRed,
    ),
    alignment: Alignment.center,
    child: CustomText(
      text: label,
      color: isOdd ? Colors.black : WHITE,
      size: 18,
    ),
  );
}

Widget titleBuilder(String label) {
  return Container(
    width: 200,
    margin: const EdgeInsets.all(5),
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      border: Border.all(width: 1),
      color: WHITE,
    ),
    alignment: Alignment.center,
    child: CustomText(
      text: label,
      color: Colors.black,
      size: 18,
      weight: FontWeight.w600,
    ),
  );
}
