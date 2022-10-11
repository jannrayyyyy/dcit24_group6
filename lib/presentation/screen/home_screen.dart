import 'package:dcit24/presentation/state_management/prulife/prulife_cubit.dart';
import 'package:dcit24/presentation/widget/table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<PrulifeCubit>().fetchPrulife();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrulifeCubit, PrulifeState>(
      builder: (context, state) {
        if (state is PrulifeLoading) {
          return const CircularProgressIndicator();
        }
        if (state is PrulifeLoaded) {
          return Column(
            children: [
              const SizedBox(height: 40),
              Image.asset('assets/logo.png', height: 200),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Row(
                      children: [
                        titleBuilder('Fund Name'),
                        titleBuilder('Bond Fund'),
                        titleBuilder('Managed Fund'),
                        titleBuilder('Growth Fund'),
                        titleBuilder('Equity Fund'),
                        titleBuilder('Proactive Fund'),
                        titleBuilder('Money Made Fund'),
                      ],
                    ),
                    Column(
                      children: state.prulife.map((e) {
                        return PrulifeTable(
                          e: e,
                          isOdd: state.prulife.indexOf(e).isOdd,
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return Center(child: Lottie.asset('assets/empty.json'));
        }
      },
    );
  }
}
