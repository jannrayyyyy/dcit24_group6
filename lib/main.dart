import 'package:dcit24/core/theme/theme_data.dart';
import 'package:dcit24/presentation/screen/main_screen.dart';
import 'package:dcit24/presentation/state_management/prulife/prulife_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dependency_injection.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(),
      home: BlocProvider<PrulifeCubit>(
        create: (context) => sl<PrulifeCubit>()..fetchPrulife(),
        child: const MainScreen(),
      ),
    );
  }
}
