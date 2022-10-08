import 'package:dcit24/presentation/screen/add_data_screen.dart';
import 'package:dcit24/presentation/state_management/prulife/prulife_cubit.dart';
import 'package:dcit24/presentation/widget/custom/custom_text.dart';
import 'package:dcit24/presentation/widget/table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dependency_injection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CustomText(
              text: 'PRU LIFE U.K.',
              size: 24,
              weight: FontWeight.w600,
              color: Colors.white,
            ),
            rowBuilder(
              'Fund Name',
              'Bond Fund',
              'Managed Fund',
              'Growth Fund',
              'Equity Fund',
              'Proactive Fund',
              'Money Made Fund',
              80,
            ),
            BlocBuilder<PrulifeCubit, PrulifeState>(
              builder: (context, state) {
                if (state is PrulifeLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is PrulifeLoaded) {
                  return Column(
                    children: state.prulife.map((e) {
                      return PrulifeTable(e: e);
                    }).toList(),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (builder) => BlocProvider<PrulifeCubit>(
                        create: (context) => sl<PrulifeCubit>(),
                        child: const AddDataScreen(),
                      )));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
