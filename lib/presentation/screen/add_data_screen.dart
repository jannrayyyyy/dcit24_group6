import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          height: 300,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration.collapsed(
                      hintText: 'fundname',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    controller: fundname,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration.collapsed(
                      hintText: 'bondFund',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    controller: bondFund,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration.collapsed(
                      hintText: 'managedFund',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    controller: managedFund,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration.collapsed(
                      hintText: 'growthFund',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    controller: growthFund,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration.collapsed(
                      hintText: 'equityFund',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    controller: equityFund,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration.collapsed(
                      hintText: 'proactiveFund',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    controller: proactiveFund,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration.collapsed(
                      hintText: 'MoneyMadeFund',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    controller: moneyMadeFund,
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const CustomText(
                        text: 'Cancel',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final prulife = PrulifeEntity(
                          fundName: fundname.text,
                          bondFund: bondFund.text,
                          managedFund: managedFund.text,
                          growthFund: growthFund.text,
                          equityFund: equityFund.text,
                          proactivefund: proactiveFund.text,
                          moneyMarketFund: moneyMadeFund.text,
                        );
                        context.read<PrulifeCubit>().addPrulife(prulife);
                        Navigator.pop(context);
                      },
                      child: const CustomText(
                        text: 'Submit',
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
