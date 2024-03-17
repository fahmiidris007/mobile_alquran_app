import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_alquran_app/config/themes/AppColors.dart';
import 'package:mobile_alquran_app/features/alquran/home/widgets/build_text.dart';

import '../../../intro/bloc/intro_bloc.dart';
import 'last_read.dart';

class Greet extends StatefulWidget {
  const Greet({super.key});

  @override
  State<Greet> createState() => _GreetState();
}

class _GreetState extends State<Greet> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntroBloc, IntroState>(
      builder: (context, state) {
        String name = (state is InputUsernameState) ? state.name : '';
        return Padding(
          padding: EdgeInsets.only(top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BuildText(
                text: 'Assalamualaikum',
                fontSize: 18,
                color: AppColors.text,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 4,
              ),
              BuildText(
                text: name,
                fontSize: 24,
                color: AppColors.text,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 24,
              ),
              LastRead()
            ],
          ),
        );
      },
    );
  }
}
