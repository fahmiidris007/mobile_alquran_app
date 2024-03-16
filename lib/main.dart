import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_alquran_app/features/alquran/bookmark/bloc/bookmark_bloc.dart';
import 'package:mobile_alquran_app/features/alquran/detail/bloc/detail_surah_bloc.dart';
import 'package:mobile_alquran_app/features/alquran/surah/bloc/list_surah_bloc.dart';
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
        BlocProvider(create: (context) => ListSurahBloc()),
        BlocProvider(create: (context) => DetailSurahBloc()),
        BlocProvider(create: (context) => BookmarkBloc()),
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
