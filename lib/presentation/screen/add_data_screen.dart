import 'package:dcit24/core/theme/theme_color.dart';
import 'package:dcit24/presentation/widget/custom/custom_container.dart';
import 'package:dcit24/presentation/widget/custom/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../domain/entities/prulife_entity.dart';
import '../state_management/prulife/prulife_cubit.dart';
import '../widget/custom/custom_text.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  final fundname = TextEditingController();
  final bondFund = TextEditingController();
  final managedFund = TextEditingController();
  final growthFund = TextEditingController();
  final equityFund = TextEditingController();
  final proactiveFund = TextEditingController();
  final moneyMadeFund = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          showBottomSheet(
              backgroundColor: darkRed,
              context: context,
              builder: (context) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CustomText(text: 'Add Data'),
                        ),
                        CustomTextField(
                          controller: fundname,
                          hintText: 'Fund Name',
                        ),
                        CustomTextField(
                          controller: bondFund,
                          hintText: 'Bond Fund',
                        ),
                        CustomTextField(
                          controller: managedFund,
                          hintText: 'Managed Fund',
                        ),
                        CustomTextField(
                          controller: growthFund,
                          hintText: 'Growth Fund',
                        ),
                        CustomTextField(
                          controller: equityFund,
                          hintText: 'Equity Fund',
                        ),
                        CustomTextField(
                          controller: proactiveFund,
                          hintText: 'Proactive Fund',
                        ),
                        CustomTextField(
                          controller: moneyMadeFund,
                          hintText: 'Money Made Fund',
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomContainer(
                                function: () {
                                  Navigator.pop(context);
                                },
                                text: 'Cancel',
                                border: Border.all(width: 1, color: WHITE),
                                alignemnt: Alignment.center,
                                margin: 8,
                                padding: 0,
                                radius: 12,
                                width: 140,
                                height: 30,
                              ),
                              CustomContainer(
                                text: 'Submit',
                                fontColor: darkRed,
                                margin: 8,
                                padding: 0,
                                radius: 12,
                                width: 140,
                                height: 30,
                                alignemnt: Alignment.center,
                                color: WHITE,
                                function: () async {
                                  final prulife = PrulifeEntity(
                                    fundName: fundname.text,
                                    bondFund: bondFund.text,
                                    managedFund: managedFund.text,
                                    growthFund: growthFund.text,
                                    equityFund: equityFund.text,
                                    proactivefund: proactiveFund.text,
                                    moneyMarketFund: moneyMadeFund.text,
                                  );
                                  if (fundname.text.isEmpty &&
                                      bondFund.text.isEmpty &&
                                      managedFund.text.isEmpty &&
                                      growthFund.text.isEmpty &&
                                      equityFund.text.isEmpty &&
                                      proactiveFund.text.isEmpty &&
                                      moneyMadeFund.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: CustomText(
                                                text:
                                                    'Please fill all the fields above!')));
                                  } else {
                                    context
                                        .read<PrulifeCubit>()
                                        .addPrulife(prulife);
                                    Navigator.pop(context);
                                  }
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        child: Lottie.asset('assets/add.json'),
      ),
    );
  }
}
