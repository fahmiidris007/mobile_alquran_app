import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_alquran_app/config/themes/AppColors.dart';
import 'package:mobile_alquran_app/features/alquran/detail/widgets/build_text.dart';
import 'package:mobile_alquran_app/features/alquran/home/home_screen.dart';
import 'package:mobile_alquran_app/features/intro/bloc/intro_bloc.dart';

class StartButton extends StatefulWidget {
  const StartButton({
    super.key,
  });

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  final TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final introBloc = BlocProvider.of<IntroBloc>(context);
    return Positioned(
      left: 0,
      bottom: -23,
      right: 0,
      child: Center(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            final name = await showDialog<String>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text(
                    'Enter Your Name',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  content: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Your Name',
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).pop(nameController.text);
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                );
              },
            );
            if (name != null && name.isNotEmpty) {
              introBloc.add(InputUsername(name));
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            decoration: BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.circular(30)),
            child: const BuildText(
              text: 'Get Started',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
