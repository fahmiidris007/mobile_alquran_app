import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_alquran_app/features/intro/bloc/intro_bloc.dart';
import 'package:mobile_alquran_app/features/intro/intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => IntroBloc()),
      ],
      child: MaterialApp(
        title: 'Mobile AlQuran App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Container(
          color: Colors.white,
          child: const IntroScreen(),
        ),
      ),
    );
  }
}
