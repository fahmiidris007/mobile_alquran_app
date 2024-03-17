import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_alquran_app/features/alquran/bookmark/bloc/bookmark_bloc.dart';
import 'package:mobile_alquran_app/features/alquran/detail/bloc/detail_surah_bloc.dart';
import 'package:mobile_alquran_app/features/alquran/search/bloc/search_bloc.dart';
import 'package:mobile_alquran_app/features/alquran/surah/bloc/list_surah_bloc.dart';
import 'package:mobile_alquran_app/features/intro/bloc/intro_bloc.dart';
import 'package:mobile_alquran_app/features/intro/intro_screen.dart';
import 'package:mobile_alquran_app/utils/shared_preferences_helper.dart';

import 'features/alquran/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? name = await SharedPreferencesHelper.getName();
  runApp(MyApp(
    initialRoute: name != null ? HomeScreen.routeName : IntroScreen.routeName,
  ));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => IntroBloc()),
        BlocProvider(create: (context) => ListSurahBloc()),
        BlocProvider(create: (context) => DetailSurahBloc()),
        BlocProvider(create: (context) => BookmarkBloc()),
        BlocProvider(create: (context) => SearchBloc())
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
        initialRoute: initialRoute,
        routes: {
          IntroScreen.routeName: (context) => const IntroScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
        },
      ),
    );
  }
}
